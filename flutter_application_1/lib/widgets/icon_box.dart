import 'package:flutter/material.dart';

class IconBox extends StatelessWidget {

  final bool isAbove5;

  const IconBox({super.key, required this.isAbove5});
  
  @override
  Widget build(BuildContext context) {

    IconData iconData = isAbove5 ? Icons.check_circle : Icons.cancel;

    return Container(
      color: Colors.grey[800],
      padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0), // use p in the run terminal to see what this does.
      margin: EdgeInsets.fromLTRB(10, 20, 20, 10), // Padding has its own widget but it won't allow defining a margin or color.  
      
      child: Icon(
        // Use https://fonts.google.com/icons to find icons
        iconData,
        color: Colors.blue,
        size: 200.0,
      ),
    );
  }
}