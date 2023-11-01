import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
      ),
      title: Text('Luffy',
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
          Text('king of the pirates'),
        ],
      ),
      trailing: Text('2:56 pm'),

    ) ;
  }
}
