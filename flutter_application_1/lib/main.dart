import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/cash_page.dart';
import 'package:flutter_application_1/pages/loading.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/flexPlayground.dart';
import 'package:flutter_application_1/pages/quotes.dart';

void main() { 
  
  runApp(MaterialApp(
    initialRoute: '/home',
    // Pages are routed via a map with key (string) & value (functions) pairs.
    routes: {
      '/': (context) => Loading(),
      // ^ context means where we currently are in the widget tree. 
      // Widgets have properties. The values of these can be other widgets or something else. 
      '/home': (context) => Home(),
      '/flexPlayground': (context) => Flexplayground(),
      '/quotes': (context) => Quotes(),
      '/cashPage': (context) => CashPage(),
    }
  ));
} 


