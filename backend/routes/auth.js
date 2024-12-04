const express=require("express")
const route=express.Router()
const twilio=require("twilio")
const dotenv=require("dotenv")
const userModel=require("../model/user.model")
dotenv.config()

const client=twilio(process.env.TWILIO_ACCOUNT_SID,process.env.TWILIO_AUTH_TOKEN)

const jwt=require("jsonwebtoken")



route.post("/send-otp",async(req,res)=>{
    const {phoneNumber}=await req.body
    const otp=Math.floor(100000 + Math.random() * 900000)
    const messageBody = `Your verification code is ${otp}. Please use this code to verify your account.`;
  try {
    console.log(phoneNumber);
    
     await client.messages.create({
        to:phoneNumber,
        body:messageBody,
        from:process.env.TWILIO_PHONE_NUMBER
     })
     
     const token=await jwt.sign({phoneNumber,otp},'shubham',{expiresIn:'10m'})
     console.log(otp,token,phoneNumber);
     
     res.status(200).json({ message: 'OTP sent successfully', otp,token });
  } catch (error) {
    console.log(error);
    res.send(error)
    
  }
   
})



route.post("/verify-otp",async(req,res)=>{
 const {otp,phoneNumber,token}=await req.body
 try {
    const decoded=jwt.verify(token,'shubham')
    if(phoneNumber === decoded.phoneNumber && parseInt(otp) === decoded.otp){
        let User=await userModel.findOne({phoneNumber})
        if(!User){
            user = userModel.create({phoneNumber})
        }
        res.status(200).json({ message: "Verification successful", user });
    }else{
        res.status(404).json({error: "Invalid verification code or phone number"})
    }
 } catch (error) {
    console.error("Error verifying OTP:", error);
    res.status(500).json({ error: "Failed to verify OTP or token expired" });
 }
})

module.exports = route