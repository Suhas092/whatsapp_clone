import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Pages/chats.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}



class _HomescreenState extends State<Homescreen> with SingleTickerProviderStateMixin{

  TabController? _controller;
  @override
  void initState(){
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1); //vsync: this to the animation controller constructor
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Whatsapp clone'),
        actions: [
          IconButton(onPressed: () {}, icon:Icon(Icons.search)),
          //IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),

          PopupMenuButton<String>(
              onSelected:(value){
                print(value);
              },
              itemBuilder: (BuildContext contesxt){
            return[
              PopupMenuItem(child: Text("New group"), value:"New group",),
              PopupMenuItem(child: Text("New broadcast"), value:"New broadcast",),
              PopupMenuItem(child: Text("Linked devices"), value:"Linked devices",),
              PopupMenuItem(child: Text("Starred messages"), value:"Starred messages",),
              PopupMenuItem(child: Text("Settings"), value:"Settings",),
            ];
          }),

        ],
        bottom: TabBar(
          controller: _controller,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt_outlined),
            ),
            Tab(
              text: 'CHATS',
            ),
            Tab(
              text: 'STATUS',
            ),
            Tab(
              text: 'CALLS',
            ),

          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Text('camera'),
          ChatPage(),
          Text('status'),
          Text('calls'),
        ],
      )
    );
  }
}


