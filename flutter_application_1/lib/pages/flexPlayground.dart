import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/flex_playground.dart';
import 'package:flutter_application_1/widgets/nav_bar.dart';

class Flexplayground extends StatefulWidget {
  const Flexplayground({super.key});

  @override
  State<Flexplayground> createState() => _FlexplaygroundState();
}

class _FlexplaygroundState extends State<Flexplayground> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlexBox Playground'),
        backgroundColor: Colors.blueGrey, 
      ),
      body: Column(
        children: [
          NavBar(),
          FlexPlayground(),
        ],
      ),
    );
  }
}