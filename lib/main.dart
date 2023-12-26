import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/NewScreen/LandingScreen.dart';
import 'package:whatsapp_clone/Pages/LoginScreen.dart';
import 'package:whatsapp_clone/homescreen.dart';
import 'package:whatsapp_clone/screens/CameraScreen.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ffi';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras=await availableCameras();
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
      home: LandingScreen(),


    );
  }

}
