import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/nav_bar.dart';
import 'package:flutter_application_1/widgets/cash_row.dart';

class CashPage extends StatefulWidget {
  const CashPage({super.key});

  @override
  State<CashPage> createState() => _CashRowState();
}

class _CashRowState extends State<CashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NavBar(),
          CashRow(),
        ],
      ),
    );
  }
}