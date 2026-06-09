import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/nav_bar.dart';
import 'package:flutter_application_1/widgets/quote-card/quoteCard_list.dart';

class Quotes extends StatefulWidget {
  const Quotes({super.key});

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quotes'),
        backgroundColor: Colors.blueGrey, 
      ),
      body: Column(
        children: [
          NavBar(),
          QuotecardList(),
        ],
      ),
    );
  }
}