import 'package:flutter/material.dart';
// used stful to get the skeleton classes. 
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyWidgetState();
  // This line instantiates the state class below. 
}

class _MyWidgetState extends State<MyStatefulWidget> {
  // Here's where we define data that can change the state over time. 
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
    // returns a widget tree just like Home().
  }
}