const express=require("express")
const route=express.Router()
const twilio=require("twilio")
const dotenv=require("dotenv")
const userModel=require("../model/user.model")
dotenv.config()

const client=twilio(process.env.TWILIO_ACCOUNT_SID,process.env.TWILIO_AUTH_TOKEN)

const jwt=require("jsonwebtoken")



// Replace 'shubham' with a secure environment variable
const jwtSecret = process.env.JWT_SECRET || 'shubham'; 

route.post("/send-otp", async (req, res) => {
  const { phoneNumber } = req.body; // Remove 'await' for req.body
  
  const otp = Math.floor(100000 + Math.random() * 900000); // 6-digit OTP
  const messageBody = `Your verification code is ${otp}. Please use this code to verify your account.`;
  
  try {
    console.log(phoneNumber);

    await client.messages.create({
      to: phoneNumber,
      body: messageBody,
      from: process.env.TWILIO_PHONE_NUMBER
    });
    
    const token = jwt.sign({ phoneNumber, otp }, jwtSecret, { expiresIn: '10m' });
    
    res.status(200).json({ message: 'OTP sent successfully', token , otp}); // Avoid sending the otp back in response
  } catch (error) {
    console.error("Error sending OTP:", error);
    res.status(500).json({ error: "Failed to send OTP" });
  }
});

route.post("/verify-otp", async (req, res) => {
  const { otp, phoneNumber, token } = req.body;
  
  try {
    const decoded = jwt.verify(token, jwtSecret);
    
    if (phoneNumber === decoded.phoneNumber && parseInt(otp) === decoded.otp) {
      let user = await userModel.findOne({ phoneNumber });
      if (!user) {
        user = await userModel.create({ phoneNumber });
      }
      res.status(200).json({ message: "Verification successful", user,userId:user._id });
    } else {
      res.status(400).json({ error: "Invalid verification code or phone number" });
    }
  } catch (error) {
    console.error("Error verifying OTP:", error);
    res.status(500).json({ error: "Failed to verify OTP or token expired" });
  }
});


module.exports = route