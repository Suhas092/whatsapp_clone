import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone/models/chatmodel.dart';
import 'package:whatsapp_clone/screens/IndividualPage.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.chatModel,required this.sourchat});

  final ChatModel chatModel;
  final ChatModel sourchat;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IndividualPage(
                      chatModel: chatModel,
                  sourchat: sourchat,
                    )));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
              child: SvgPicture.asset(
                chatModel.isGroup ?? false
                    ?'assets/groups.svg' : 'assets/person.svg',
                color: Colors.white,
                height: 38,
                width: 38,
              ),
            ),
            title: Text(
              chatModel.name ?? "",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 3,
                ),
                Text(chatModel.CurrentMessage ?? ""),
              ],
            ),
            trailing: Text(chatModel.time ?? ""),
          ),
          // Padding(
          //   padding:EdgeInsets.only(right: 20, left:20 ),
          //   child: const Divider(
          //     thickness: 1,),
          // ),
        ],
      ),
    );
  }
}
