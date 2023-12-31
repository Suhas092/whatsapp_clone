import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/chatmodel.dart';
class ButtonCard extends StatelessWidget {
  //const ButtonCard({required Key key,required this.name,required this.Icon}):super(key:key);
  const ButtonCard({Key? key,this.name,this.icon}) : super(key: key);
  //const ButtonCard({Key? key, this.contact = const ChatModel()}) : super(key: key);


  final String? name;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:CircleAvatar(
        radius: 23,
        child: Icon(icon,size: 26,color: Colors.white,),
        backgroundColor: Colors.blue,
      ),
      title: Text(name?? "",style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold
      ),
      ) ,

    );
  }
}
