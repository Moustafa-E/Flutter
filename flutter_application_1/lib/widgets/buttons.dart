import 'package:flutter/material.dart';

class CustomFloatingAction extends StatelessWidget {
  const CustomFloatingAction({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.blue[600],
      // Pro tip: Hover over a widget to see its possible properties. The "child" property lets us nest widgets.
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

        child: Text(
          'floating action button', 
          textScaler: TextScaler.linear(0.6),
          textAlign: TextAlign.center, // found in docs. When you don't know what a property takes, try a class of the same name. 
          // ^ This one confused me because I thought I had to wrap it in a center wgt first but it happened to have a property that also does that.
          style: TextStyle(
            color: Colors.white,
          ) 
        ),
      ), 
    );
  }
}