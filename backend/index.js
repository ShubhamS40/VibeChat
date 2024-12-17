const express = require("express");
const http = require("http");
const cors = require("cors");
const session = require("express-session");
const { Server } = require("socket.io");
const authRoutes = require("./routes/auth");
const userRoute = require("./routes/user");
const db = require("./config/db");

const app = express();

// Create HTTP server
const server = http.createServer(app);

// Set up Socket.IO with the HTTP server
const io = new Server(server, {
  cors: {
    origin: "*", // Allows all origins, you can restrict it later
    methods: ["GET", "POST"],
    allowedHeaders: ["Content-Type"],
  },
});

// Middleware
app.use(express.json());
app.use(
  session({
    secret: "your-secret-key", // Secret key for session encryption
    resave: false,
    saveUninitialized: true,
  })
);

// Routes
app.use("/api/auth", authRoutes);
app.use("/api", userRoute);

// Database connection
db;

// Listening for HTTP requests
app.listen(2000, () => {
  console.log("Express Server listening on port 2000");
});

// Handle Socket.IO connections
io.on("connection", (socket) => {
  console.log("A user connected");

  // Example: emitting a message to all clients
  socket.emit("welcome", "Welcome to the chat!");

  socket.on("disconnect", () => {
    console.log("A user disconnected");
  });
});

// Listen for incoming Socket.IO connections on port 3000
server.listen(3000, "0.0.0.0", () => {
  console.log("Socket.IO server listening on port 3000");
});
