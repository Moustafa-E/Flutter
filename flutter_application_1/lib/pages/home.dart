import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/divider.dart';
import '../widgets/icon_box.dart';
import '../widgets/body_text.dart';
import '../widgets/buttons.dart';
import 'package:flutter_application_1/widgets/nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  // Was stateless. I used the quick action menu to convert it to stateful. 
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Asynchronous Code
  void getData() async {
    // simulate network request
    String char1 = await Future.delayed(Duration(seconds: 2), () {
      // other async code that depends on this needs shouldn't run first if this takes too long, so we "await" this one first
      print('Yoshi');
      return 'Yoshi';
    });
    
    print('-'); // Future.delayed() is async, meaning it won't block further code while it's executing. 
    // if it was synchronous, you'd see Yoshi after Xs then -. Instead you see - immediately, then Yoshi.

    String char2 = await Future.delayed(Duration(seconds: 2), () {
      // You can await as many statements as you like in an async function. 
      print('ShyGuy');
      return 'ShyGuy';
    });

    print('1: $char1, 2: $char2'); 
    // had we not used await, this would print null for char1 & 2 because it would run before obtaining them.
    // Await doesn't cause a block in code outside of this function btw
  }

  void initState() {
    // more about how this & build() work in CashRow()
    getData();
    // Notice that a home page lower in the routing stack does not get loaded twice. When you're in Home and you press Home, you get the widgets building and see the prints.
    // ... When you go back to the one already loaded, the loading doesn't happen twice because the page already exists in the stack. initState() has already ran for it. 
    print("I'm not waiting for getData()");
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      // "appBar" is a property of Scaffold().
      appBar: AppBar(
        // title is a property of AppBar(). Display text using the Text() widget.
        title: Text('Home'),
        backgroundColor: Colors.blueGrey, 
        // Since we're inside the MaterialApp wgt, you have access to various Material Design Properties by google. 
        // Learn more about that here: https://m3.material.io/. Square brackets is the strength.
      ),
      body: ListView( // Column() or Row() would overflow / not fit the screen. 
        // Think "child" as a generic property for any widget. So far we've just used specific default ones.
        // "children" takes a list of whatever you cast the list to. In this case we have a list of widgets.
        children: <Widget>[
          NavBar(),
          
          CustomDivider(),

          BodyText(),

          Image.asset('space.png'),
          
          IconBox(),
        ]
      ),
      floatingActionButton: CustomFloatingAction(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}