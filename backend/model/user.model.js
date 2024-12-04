
const { default: mongoose } = require("mongoose");


const userSchema=new mongoose.Schema({
    phoneNumber: { type: String, required: true, unique: true },
     FirstName:String,
     LastName:String
})

const userModel= mongoose.model('users', userSchema);

module.exports= userModel