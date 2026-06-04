import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/divider.dart';
import 'widgets/flex_playground.dart';
import 'widgets/cash_row.dart';
import 'widgets/icon_box.dart';
import 'widgets/body_text.dart';
import 'widgets/buttons.dart';
import 'widgets/lists_of_data.dart';

void main() { runApp(MaterialApp(
  // Widgets have properties. The values of these can be other widgets or something else. 
  // "home" is a property of MaterialApp(). We're calling our own custom widget below.
  home: Home(),
));} 

class Home extends StatefulWidget {
  const Home({super.key});

  // Was stateless. I used the quick action menu to convert it to stateful. 
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],

      // "appBar" is a property of Scaffold().
      appBar: AppBar(
        // title is a property of AppBar(). Display text using the Text() widget.
        title: Text('title'),
        backgroundColor: Colors.blue[600], 
        // Since we're inside the MaterialApp wgt, you have access to various Material Design Properties by google. 
        // Learn more about that here: https://m3.material.io/. Square brackets is the strength.
      ),
      body: ListView( // Column() or Row() would overflow / not fit the screen. 
        // Think "child" as a generic property for any widget. So far we've just used specific default ones.
        // "children" takes a list of whatever you cast the list to. In this case we have a list of widgets.
        children: <Widget>[
          
          CustomDivider(),

          BodyText(),

          Image.asset('space.png'),
          
          IconBox(),

          CashRow(),

          FlexPlayground(),

          ListsOfData()
        ]
      ),
      floatingActionButton: CustomFloatingAction(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

