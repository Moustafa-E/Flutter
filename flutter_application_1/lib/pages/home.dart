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

  // data to be recieved from Loading(). See build().
  Map data = {};

  @override
  Widget build(BuildContext context) {  
    print('Home build() ran');
    // recieved from third parameter in Navigator.push in Loading() specifically in the build() function.
    data = ModalRoute.of(context)?.settings.arguments as Map; // no need to set state because this is being done before the widget is built.
    // !. is accessing "settings" with a null check. If null, don't process. Remove for more info. 
    
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

          Container(decoration: BoxDecoration(color: Colors.grey), child: Center(child: Text(data['result']))),

          Image.asset('space.png'),
          
          IconBox(isAbove5: data['isAbove5'], ),
        ]
      ),
      floatingActionButton: CustomFloatingAction(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}