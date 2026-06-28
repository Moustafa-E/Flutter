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
  void initState() {
    print('>> Home() initState()');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {  
    print('>> Home() build()');
    // recieved from third parameter in Navigator.push in Loading() specifically in the build() function.
    data = ModalRoute.of(context)?.settings.arguments as Map; // no need to set state because this is being done before the widget is built.
    // !. is accessing "settings" with a null check. If null, don't process. Remove for more info. 
    
    return Scaffold(
      backgroundColor: Colors.grey[850], // this will extend to the phone's status bar.
      
      appBar: AppBar(
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
          //TODO: Find out how to eliminate that null page on hot restart. 
          // The null page on startup didn't happen when Icon one didn't exist and this was just data.toString() with data being an Object? . 
          // As long as I click Home button which routes to '/' then it works as expected. Something different with hot restart. Maybe hot restart is using last page? 
          // YYESSS. Hot restart is going to the last seen page - /home - before it's ready, giving rise to the exception. 
          // So how is loading reached at all during a hot restart? Why would it not remain on an exception-state home page?

          Image.asset('space.png'),
          
          IconBox(isAbove5: data['isAbove5']),
          // For background images, consider #33 SafeArea() widget demo at 9:51. SafeArea(child:Container(decoration:BoxDecoration(image:DecorationImage(image:AssetImage(),fit:BoxFit.cover))))
        ]
      ),
      floatingActionButton: CustomFloatingAction(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}