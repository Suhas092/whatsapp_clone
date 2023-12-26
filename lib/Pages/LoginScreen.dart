import 'package:flutter/material.dart';
import 'package:whatsapp_clone/scratchcard/ButtonCard.dart';

import '../homescreen.dart';
import '../models/chatmodel.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ChatModel sourceChat;
  List<ChatModel> chatmodels=[
    ChatModel(
      name: 'Luffy',
      isGroup: false,
      time: '12:00pm',
      icon: 'person.svg',
      CurrentMessage: 'king of the pirates',
      id: 1,
    ),
    ChatModel(
      name: 'zoro',
      isGroup: false,
      time: '12:05pm',
      icon: 'person.svg',
      CurrentMessage: 'Greatest Swordsmen ',
      id: 2,
    ),
    // ChatModel(
    //   name: 'Strawhats',
    //   isGroup: true,
    //   time: '1:00pm',
    //   icon: 'groups.svg',
    //   CurrentMessage: 'bounty has been published',
    // ),
    ChatModel(
      name: 'nami',
      isGroup: false,
      time: '1:02pm',
      icon: 'person.svg',
      CurrentMessage: 'where is money?',
      id: 3,

    ),
    ChatModel(
      name: 'Ussop',
      isGroup: false,
      time: '1:03pm',
      icon: 'person.svg',
      CurrentMessage: 'have you seen my slingsot?',
      id: 4,
    ),
    ChatModel(
      name: 'Sanji',
      isGroup: false,
      time: '1:03pm',
      icon: 'person.svg',
      CurrentMessage: 'Nami swam!',
      id: 5,
    )

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chatmodels.length,
          itemBuilder: (context,index)=>InkWell(
            onTap: (){
              sourceChat=chatmodels.removeAt(index);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(
                  builder:(builder)=>Homescreen(
                    chatmodels:chatmodels,
                    sourchat: sourceChat,
                  )));
            },
            child: ButtonCard(
            name: chatmodels[index].name,
            icon: Icons.person,
            ),
          )),

    );
  }
}
