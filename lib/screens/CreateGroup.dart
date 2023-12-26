import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chatmodel.dart';
import 'package:whatsapp_clone/scratchcard/AvatarCard.dart';
import 'package:whatsapp_clone/scratchcard/ButtonCard.dart';
import 'package:whatsapp_clone/scratchcard/ContactCard.dart';
class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});


  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  //get key => null;
  //get contact => null;
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
  List<ChatModel> groups=[];


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("New Grooup",
              style: TextStyle(fontSize: 17,
              ),),

            Text("Add Participants",
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

        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: contacts.length+1,
              itemBuilder: (context, index) {
                if(index==0){
                  return Container(
                    height: groups.length >0 ? 90 : 10,
                  );
                }
                return InkWell(
                  onTap: () {
                    if(contacts[index-1].select==false) {
                      setState(() {
                        contacts[index-1].select = true;
                        groups.add(contacts[index-1]);
                      });
                    }
                    else{
                      setState(() {
                        contacts[index-1].select=false;
                        groups.remove(contacts[index-1]);
                      });
                    }
                  },
                  child: ContactCard(
                    contact: contacts[index-1],
                  ),
                );
          }),
          groups.length>0
            ?Column(
            children: [
              Container(
                height: 75,
                color: Colors.white,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: contacts.length,
                  itemBuilder: (context,index) {
                    if (contacts[index].select == true) {
                      return InkWell(
                        onTap: (){
                          setState(() {
                          groups.remove(contacts[index]);
                          contacts[index].select = false;
                          });
                        },
                        child: AvatarCard(
                          contact: contacts[index],
                        ),
                      );
                    }
                    else{
                      return Container();
                    }
                  }),
              ),
              Divider(
                thickness: 1,
              )
            ],
          ):Container(),
        ],
      )
    );
  }
}
