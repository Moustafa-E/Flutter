import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper-methods/handle_clicks.dart';

class CashRow extends StatefulWidget {
  const CashRow({super.key});

  @override
  State<CashRow> createState() => _CashRowState();
}

class _CashRowState extends State<CashRow> {
  String clickSmiley = '';
  @override
  void initState(){
    // this function is called for all widgets once. We're just calling the parent version (that we're overriding) + a print statement to show how it works
    // When you load a page with this widget, you'll fire the initState() method.
    super.initState();
    if (kDebugMode) {
      print("initState() function ran");
    }
  }
  @override
  Widget build(BuildContext context) {
    // build() will fire twice in stateful widgets. 1. when they first load with initState() & 2. when some data on the widget changes.
    if (kDebugMode) {
      print("build() function ran");
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container( // Clicking on a widget and selecting the lightbulb gives you a bunch of quick actions you can take. 
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: ElevatedButton(
              onPressed: () {
                HandleClicks.printCatFace(text: ':3');
                /* 
                - Changing the state variable directly won't retrigger the build function. That's what setState( () {} ) does.
                - Also not sure how to extract to a separate function yet since setState() only works in a stateful widget. 
                */ 
                setState(() {
                  clickSmiley = ':3';
                });
              }, 
            
            child: Text('Click me.'),
        )),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: ElevatedButton.icon(
              onPressed: () {
                HandleClicks.printCatFace(text: '>:3');
                setState(() {
                  clickSmiley = '>:3';
                });
              }, 
              
              label: Text('Click me too.'),
              icon: Icon(
                Icons.add_box,
                color: Colors.blue,
              ),
        )),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: CircleAvatar(
            backgroundImage: AssetImage('cash.png'),

        )),
        Text(
          clickSmiley,
          style: TextStyle(
            color: Colors.blue
          )
        ),
      ] 
    );
  }
}