const express=require("express")
const { default: mongoose } = require("mongoose")
const userModel = require("../model/user.model")
const route=express.Router()





route.put("/update-user/:id", async (req, res) => {
    const { id } = req.params; // Extract user ID from params
    const { firstName, lastName } = req.body; // Extract user details from body
  
    try {
      // Find user by ID and update details
      const user = await userModel.findByIdAndUpdate(
        id,
        { firstName, lastName }, // Update fields
        { new: true } // Return updated user
      );
  
      if (!user) { // If user is not found
        res.status(404).json({ message: "User not found" });
        return;
      }
  
      res.status(200).json({ message: "User updated successfully", user }); // Success response
    } catch (error) {
      console.error("Error updating user:", error);
      res.status(500).json({ message: "Error updating user", error });
    }
  });
  

module.exports=route

