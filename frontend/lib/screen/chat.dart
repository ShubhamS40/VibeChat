import 'package:flutter/material.dart';
import 'package:vibechat/components/card_list.dart';

class Chatscreen extends StatefulWidget {
  const Chatscreen({super.key});

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);  // Initialize TabController with vsync
  }

  @override
  void dispose() {
    _tabController.dispose();  // Dispose of the controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xF0002DE3),
        title: Text("Chats", style: TextStyle(color: Colors.white)),
        actions: [
          Icon(Icons.app_registration, color: Colors.white)
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,  // Color for selected tab (text + icon)
          unselectedLabelColor: Colors.white,  // Color for unselected tabs (text + icon)
          tabs: [
            Tab(text: "Camera",icon: Icon(Icons.camera_alt, color: Colors.white)),
            Tab(text: "Chats", icon: Icon(Icons.chat, color: Colors.white)),
            Tab(text: "Status", icon: Icon(Icons.access_time, color: Colors.white)),
            Tab(text: "Calls", icon: Icon(Icons.call, color: Colors.white)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CardList(),
          Text("chats",  ),
          Text("Status", ),
          Text("calls", ),
        ],
      ),
    );
  }
}
