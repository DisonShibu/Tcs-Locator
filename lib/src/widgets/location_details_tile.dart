import 'package:flutter/material.dart';

class locationDetaislTile extends StatelessWidget {
  String heading;
  String title;
  IconData icon;
  Function onPressed;
  locationDetaislTile({this.title, this.heading, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      

     
      title: Text(
        heading,
        style: TextStyle(fontSize: 10, color: Colors.grey),
      ),
      subtitle:
          Text(heading, style: TextStyle(fontSize: 15, color: Colors.black)),
      trailing: Icon(icon),
      onTap: () {
        onPressed();
      },
      
    );
    ;
  }
}
