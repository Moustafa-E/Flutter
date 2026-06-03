import 'quote.dart';
import 'quote_card.dart';
import 'package:flutter/material.dart';

class ListsOfData extends StatefulWidget {
  const ListsOfData({super.key});

  @override
  State<ListsOfData> createState() => _ListsOfDataState();
}

class _ListsOfDataState extends State<ListsOfData> {

  List<Quote> quotes = [
    Quote(author: 'me', text: "cash is cool"),
    Quote(author: 'me', text: "it's too hot"),
    Quote(author: 'me', text: "my head hurts"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),

      child: Column(
        // .map operates on each item in the list and expects a function. This function will return the quoteCard widget defined below.
        // Then we convert the whole operation to a list because children: expects that. 
        children: quotes.map( (quote) => QuoteCard(quote: quote) ).toList()
      ),
    );
  }
}