import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 50,
      color: Colors.grey[800],
      indent: 10,
      endIndent: 10,
    );
  }
}