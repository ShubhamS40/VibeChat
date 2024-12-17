import 'package:flutter/material.dart';
import 'package:vibechat/components/chat.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with SingleTickerProviderStateMixin {
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
          PopupMenuButton(color: Colors.white,onSelected: (value){print(value);},itemBuilder: (BuildContext context){
              return [
                PopupMenuItem(child: Text("Advertise"),value: "New group",),
                PopupMenuItem(child: Text("Business tools"),value: "New group",),
                PopupMenuItem(child: Text("MArketing messages"),value: "New group",),
                PopupMenuItem(child: Text("New Group"),value: "New group",),
                PopupMenuItem(child: Text("New broadcast"),value: "New group",),
                PopupMenuItem(child: Text("Communities"),value: "New group",),
                PopupMenuItem(child: Text("Labels"),value: "New group",),
                PopupMenuItem(child: Text("Linked devices"),value: "New group",),
                PopupMenuItem(child: Text("Starteed messages"),value: "New group",),
                PopupMenuItem(child: Text("Settings"),value: "New group",),

              ];
          },)
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
          Chatpage(),
          Text("camera"),

          Text("Status", ),
          Text("calls", ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},
      child: Icon(Icons.message,color: Colors.white,),
        backgroundColor: Color(0xF0002DE3),
      ),
    );
  }
}
