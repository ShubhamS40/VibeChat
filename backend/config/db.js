const { default: mongoose } = require("mongoose");

 async function dbConnect() {
    await mongoose.connect("mongodb://localhost:27017/vibechat")
    console.log("mogodb Connected Successfully");
    
}

dbConnect()