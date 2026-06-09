import 'quote.dart';
import 'quote_card.dart';
import 'package:flutter/material.dart';

class QuotecardList extends StatefulWidget {
  const QuotecardList({super.key});

  @override
  State<QuotecardList> createState() => _ListsOfDataState();
}

class _ListsOfDataState extends State<QuotecardList> {

  List<Quote> quoteList = [
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
        children: quoteList.map( (quote) => QuoteCard(
          quote: quote,
          delete: () {
            // This will be used for the TextButton() inside the QuoteCard()
            setState(() => quoteList.remove(quote));
          },
        )).toList()
      ),
    );
  }
}