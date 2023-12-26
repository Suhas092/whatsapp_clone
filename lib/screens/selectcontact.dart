import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chatmodel.dart';
import 'package:whatsapp_clone/scratchcard/ButtonCard.dart';
import 'package:whatsapp_clone/scratchcard/ContactCard.dart';
import 'package:whatsapp_clone/screens/CreateGroup.dart';
class SelectContact extends StatefulWidget {
  const SelectContact({super.key});


  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  //get key => null;

  //get contact => null;

  @override
  Widget build(BuildContext context) {

    List<ChatModel> contacts=[
      ChatModel(name: "Monkey D Luffy",
        status: "King Of The Pirates!"
      ),

      ChatModel(name: "Roronoa Zoro",
          status: "King Of Hell!"
      ),

      ChatModel(name: "Vinsmoke Saanji",
          status: "Finding AllBlue!"
      ),

      ChatModel(name: "Nami",
          status: "World Map"
      ),
      ChatModel(name: "GOD Ussop",
          status: "Sogeking"
      ),
      ChatModel(name: "Tony Tony Chopper",
          status: "Strawhats Doctor"
      ),
      ChatModel(name: "Nico Robin",
          status: "Archeologist"
      ),
      ChatModel(name: "Franky",
          status: "Shipwright"
      ),
      ChatModel(name: "SoulKing Brook",
          status: "Musician"
      ),
      ChatModel(name: "Jinbei",
          status: "helmsman"
      ),

    ];

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select contact",
          style: TextStyle(fontSize: 17,
          ),),

            Text("256 contacts",
              style: TextStyle(fontSize: 12,
              ),),
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(
            Icons.search,
            size: 26,
          color: Colors.white,)
          ),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext contesxt) {
            return [
              PopupMenuItem(
                child: Text("Invite a friend"),
                value: "Invite a friend",
              ),
              PopupMenuItem(
                child: Text("Contacts"),
                value: "Contacts",
              ),
              PopupMenuItem(
                child: Text("Refresh"),
                value: "Refresh",
              ),
              PopupMenuItem(
                child: Text("Help"),
                value: "Help",
              ),


            ];
          }),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length+3,
        itemBuilder: (context, index) {
          //=> ContactCard(
          //contact: contacts[index],
          //key: ValueKey(index),
          if (index == 0) {
            return InkWell(
                onTap:(){
                  Navigator.push(context,MaterialPageRoute(
                      builder: (builder)=>CreateGroup()));
                },
                child: ButtonCard(icon: Icons.group,name:"New Group",));
          } else if (index == 1) {
            return ButtonCard(icon: Icons.person_add,name:"New contact",);
          }else if (index == 2) {
            return ButtonCard(icon: Icons.groups,name:"New community",);
          }
          return ContactCard(
            contact: contacts[index-3],
          );
        }
      ),
    );
  }
}
