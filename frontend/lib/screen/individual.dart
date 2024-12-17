import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:vibechat/ui_component/ownMessagecard.dart';
import 'package:vibechat/ui_component/replyMessagecard.dart';



class IndividualPage extends StatefulWidget {
  final String name;

  const IndividualPage({super.key, required this.name});

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool _showEmojiPicker = false; // Track emoji picker visibility
  TextEditingController _messageController = TextEditingController();
  String? value;

  @override
  void initState() {
    super.initState();
    _messageController.addListener(() {
      setState(() {
        value = _messageController.text;
      });
    });
    connect();
  }


 void connect(){
   IO.Socket socket = IO.io('http://192.168.4.214:3000',<String,dynamic>{
     "transport":["websocket"],
     "autoConnect":"false"
   });

   socket.connect();
   socket.on('welcome', (data){
     print(data);
   });

 }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF002DE3),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "online",
                  style: TextStyle(fontSize: 13, color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call, color: Colors.white),
            onPressed: () {
              // Add call functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.videocam, color: Colors.white),
            onPressed: () {
              // Add video call functionality
            },
          ),
          PopupMenuButton(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(value: "Advertise", child: Text("Advertise")),
                const PopupMenuItem(value: "Business tools", child: Text("Business tools")),
                const PopupMenuItem(value: "Marketing messages", child: Text("Marketing messages")),
                const PopupMenuItem(value: "New Group", child: Text("New Group")),
                const PopupMenuItem(value: "New broadcast", child: Text("New broadcast")),
                const PopupMenuItem(value: "Communities", child: Text("Communities")),
                const PopupMenuItem(value: "Labels", child: Text("Labels")),
                const PopupMenuItem(value: "Linked devices", child: Text("Linked devices")),
                const PopupMenuItem(value: "Starred messages", child: Text("Starred messages")),
                const PopupMenuItem(value: "Settings", child: Text("Settings")),
              ];
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: const [
              Ownmessagecard(),
              Replymessagecard(),
              Ownmessagecard(),
              Replymessagecard(),
              Ownmessagecard(),
              Replymessagecard(),
            ],
          ),
          Column(
            children: [
              Expanded(child: Container()), // Placeholder for chat messages
              _buildMessageInput(),
            ],
          ),
          if (_showEmojiPicker)
            Positioned(
              bottom: 0, // Position the emoji picker at the bottom of the screen
              left: 0,
              right: 0,
              child: _buildEmojiPicker(),
            ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: _messageController,
                onTap: () {
                  setState(() {
                    _showEmojiPicker = false; // Hide emoji picker on text field tap
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.emoji_emotions_outlined),
                    onPressed: () {
                      setState(() {
                        _showEmojiPicker = !_showEmojiPicker;
                      });
                    },
                  ),
                  hintText: "Type a message",
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            radius: 25,
            backgroundColor: const Color(0xFF002DE3),
            child: IconButton(
              icon: Icon(
                _messageController.text.isNotEmpty ? Icons.send : Icons.mic,
                color: Colors.white,
              ),
              onPressed: () {
                // Handle sending message or voice recording
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmojiPicker() {
    return EmojiPicker(
      onEmojiSelected: (category, emoji) {
        // Append the selected emoji to the message
        _messageController.text += emoji.emoji;
      },
      config: Config(
        height: 250, // Fixed height for the emoji picker
      ),
    );
  }
}
