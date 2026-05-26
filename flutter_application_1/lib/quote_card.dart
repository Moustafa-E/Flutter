import 'quote.dart';
import 'package:flutter/material.dart';


class QuoteCard extends StatelessWidget {

  final Quote quote;
  const QuoteCard({super.key, required this.quote});

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
          ],
        ),
      ),
    );
  }
}