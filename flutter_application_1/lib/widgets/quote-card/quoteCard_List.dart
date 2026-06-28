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

      child: Column( /// OLD 
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

      //// For a list of widgets you can click, see #34 List View Builder. #35 shows you how to pass data from those widgets you click to a new page. 
      // in #35 he also shows how to pop the screen off of the widget stack just like the back button does. 
      // Navigator.pushNamed() + Navigator.pop() for a temp menu. If you're sending information back to the page that was pushed, expect to receive it *in the push* to give it a place to land.
      //  if you're expecting something, it needs to have a future right? Navigator.pushNamed does. Store it in a variable with:
      //    dynamic result = await Navigator.pushNamed(context, '/route')
      //  this all happens in an onPressed / onTap property so make the anonymous function async.
      //  Finally you can use setState() to update the data property and rerun the build function. Whole thing should look like this for a temp menu:
      
      // onPressed: () async {
      //    dynamic result = await Navigator.pushNamed(context, '/path');
      //    setState((){ data = 'popProperty': result[popProperty]});             
      // }

      // setState() overrides data that has been set with ModalRoute.of(context).settings.arguments; if it was used. That's a problem because that is inside the build() function which is reran by setState().
      // Just use a ternary operator on data during ModalRoute.of() like so: data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;.

      // Flutter website's cookbook is good for ideas including animation. 
    );
  }
}