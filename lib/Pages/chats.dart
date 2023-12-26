import 'package:flutter/material.dart';
import 'package:whatsapp_clone/scratchcard/scratchcard.dart';
import 'package:whatsapp_clone/screens/selectcontact.dart';

import '../models/chatmodel.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key,required this.chatmodels, required this.sourchat});
  final List<ChatModel> chatmodels;
  final ChatModel sourchat;


  @override
  State<ChatPage> createState() => _ChatPageState();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class _ChatPageState extends State<ChatPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (builder)=> SelectContact()));
        },
        child: Icon(Icons.chat),
      ),
      body: Stack(
        children: [
      ColorFiltered(
      colorFilter: ColorFilter.mode(
      Colors.blue.withOpacity(0.2), // Adjust the opacity here (0.0 to 1.0)
      BlendMode.dstATop,
    ),
          child: Image.asset(
            'assets/strawhats.jpg', // Replace with the actual path to your homescreen image
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
      ),
          ListView.builder(
            itemCount: widget.chatmodels.length,
            itemBuilder: (context,index)=>CustomCard(
              chatModel: widget.chatmodels[index],
              sourchat: widget.sourchat,

            ),
          ),
        ],
      ),
    );
  }

}
