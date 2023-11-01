import 'package:flutter/material.dart';
import 'package:whatsapp_clone/homescreen.dart';


void main(){
  runApp(MyApp());


}




class MyApp extends StatelessWidget{

  @override
  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primaryColor: Color(0xFF075e54),
      //   //accentColor: Color(0xFF128C7E),
      // ),
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Homescreen(),


    );
  }

}
