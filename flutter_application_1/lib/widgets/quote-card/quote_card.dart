import 'quote.dart';
import 'package:flutter/material.dart';


class QuoteCard extends StatelessWidget {

  final Quote quote;
  final Function() delete; // #21: functions as parameters. 
  
  // If we want to modify a list outside of the class (delete a quote from the quote list), then we can pass a function into the class as a required parameter.
  // TODO: Find out why a Function() declaration works but a Function one doesn't. 

  const QuoteCard({ 
    super.key, 
    required this.quote, 
    required this.delete 
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16,16,16,6),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
    
          children: [
            Text(
              quote.text!,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[900]
              )
            ),
            Text(
              quote.author!,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[800]
              )
            ),
            TextButton(
              onPressed: delete, // Passed in when we call QuoteCard() in the map.
              
              child: Row(
                children: [
                  Icon(Icons.delete),
                  Text('delete quote'),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}