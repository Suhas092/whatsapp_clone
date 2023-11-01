import 'package:flutter/material.dart';
import 'package:whatsapp_clone/scratchcard/scratchcard.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.chat),
      ),
      body: ListView(
        children: [

          CustomCard(),
        ],
      ),
    );
  }

}
