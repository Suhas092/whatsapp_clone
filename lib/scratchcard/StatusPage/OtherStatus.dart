import 'package:flutter/material.dart';

class OtherStatus extends StatelessWidget {
  OtherStatus({Key? key, this.name, this.imagename}) : super(key: key);

  final String? name;
  final String time = _getCurrentTime();
  final String? imagename;

  // Helper method to get the current time
  static String _getCurrentTime() {
    final currentTime = DateTime.now();
    final formattedTime = "${currentTime.hour}:${currentTime.minute}";
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 26,
        backgroundImage: AssetImage(imagename!),
      ),
      title: Text(
        name!,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      subtitle: Text(
        "Today at, $time",
        style: TextStyle(fontSize: 14, color: Colors.grey[900]),
      ),
    );
  }
}
