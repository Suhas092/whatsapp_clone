import 'package:flutter/material.dart';
import '../../screens/CameraScreen.dart';

class HeadOwnStatus extends StatelessWidget {
  const HeadOwnStatus({Key? key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CameraScreen(),
          ),
        );
      },
      child: ListTile(
        //contentPadding: EdgeInsets.symmetric(vertical: 0),
        leading: Stack(
          children: [
            CircleAvatar(
              radius: 27,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/luffy.jpg"),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 10,
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        title: Text(
          "My Status",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          "Tap to add status update",
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[900],
          ),
        ),
      ),
    );
  }
}
