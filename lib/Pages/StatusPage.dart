import 'package:flutter/material.dart';
import 'package:whatsapp_clone/scratchcard/StatusPage/HeadOwnStatus.dart';
import 'package:whatsapp_clone/scratchcard/StatusPage/OtherStatus.dart';
import 'package:whatsapp_clone/screens/CameraScreen.dart';
import 'package:whatsapp_clone/screens/CameraViewPage.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked, // Move buttons to the right side
      floatingActionButton: SizedBox(
        height: 155,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.blueGrey[100],
              elevation: 05,
              child: Icon(Icons.edit, color: Colors.blueGrey[900]),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraScreen(),
                    ),
                  );

                },
                backgroundColor: Colors.blue,
                elevation: 5,
                child: Icon(Icons.camera_alt_rounded),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            HeadOwnStatus(),
            label("Recent updates"),

            OtherStatus(
              name:"nami",
              imagename: "assets/nami.jpg",
            ),
            OtherStatus(
              name:"Ussop",
              imagename: "assets/ussop.png",
            ),

            OtherStatus(
              name:"Boa Hanckock",
              imagename: "assets/boa.jpg",
            ),
            SizedBox(
              height: 7,
            ),
            label("Viewed updates"),
            OtherStatus(
              name:"Zoro",
              imagename: "assets/zorojuro.jpg",
            ),

            OtherStatus(
              name:"Sanji",
              imagename: "assets/sanji.jpg",
            ),
            SizedBox(
              height: 7,
            ),
            label("Muted Updates"),


          ],
        ),
      ),
    );
  }
  Widget label(String labelname){
    return Container(
      height: 33,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[300]?.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 7,
        ),
        child: Text(labelname,
          style: TextStyle(fontSize: 13,
              fontWeight: FontWeight.bold),),
      ),
    );
  }
}
