import 'package:flutter/material.dart';

class IconBox extends StatelessWidget {
  const IconBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[800],
      padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0), // use p in the run terminal to see what this does.
      margin: EdgeInsets.fromLTRB(10, 20, 20, 10), // Padding has its own widget but it won't allow defining a margin or color.  
      
      child: Icon(
        Icons.airport_shuttle,
        color: Colors.blue,
        size: 200.0,
      ),
    );
  }
}