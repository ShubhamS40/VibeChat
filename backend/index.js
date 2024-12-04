const express=require("express")
const app=express()
const authRoutes = require('./routes/auth');
const session = require("express-session");
const db=require("./config/db")
const cors=require("cors")
app.use(express.json())
app.use(cors({
    origin:"*",
    methods: ['GET', 'POST'],
    allowedHeaders: ['Content-Type'],
}))
db
app.use("/api/auth",authRoutes)



app.listen(2000,()=>{console.log("Serevr listening ")});
