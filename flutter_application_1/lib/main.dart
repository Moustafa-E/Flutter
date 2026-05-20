import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() { runApp(MaterialApp(
  // Widgets have properties. The values of these can be other widgets or something else. 
  // "home" is a property of MaterialApp(). We're calling our own custom widget below.
  home: Home(),
));} 

//// Stateless Widgets ////
class demo extends StatelessWidget {
  // This is us making our own widget class. 
  /* 
    This lets the app hot reload on its own because Flutter will rerun build() when a change is detected... at least in Android Studio. Hot reload works better just not automatically.
    - Stateless: widget state cannot change during runtime
    - Stateful: widget state can change during runtime 
  */
  @override // Parent has its own build() function. We're just overriding it.
  Widget build(BuildContext context) {
    return Container();
    // build() function will return the Container() widget & any children. Can contain any widget so we'll return what we built (was previously directly in the Home property in main())
      
  }
}

void handleClick({String text = ':)'}) {
  // Got a warning when trying just print('thanks') because it won't work well in production. 
  if(kDebugMode) {
    debugPrint(text);
  }
}

class Home extends StatelessWidget {
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
          Text(
            'centered body',
            style: TextStyle( // follows CSS convention for styling text. Specify style, then within that style specify things like color.
              fontSize: 20.0,
              fontWeight: FontWeight.bold, 
              /* ^ A bit weird here. FontWeight treated as a "class" that isn't quite a widget. Kinda like Colors.red. Perhaps widgets will "contain" something, whereas raw classes will "change" something.
              -- I tried with brackets, and it looks like these "raw classes" are called generative enum constructors. They just generate a constant.
              */
              color: Colors.grey[300],
              fontFamily: 'FiraCode',
              /* Grab a font from google, extract the zip and put the font file in some directory you can refer to. 
              Go to pubspec.yaml, add the font family & asset, then run "flutter pub get" 
              Quit and start the app again. Hot restart didn't work. */
            ),
            textAlign: TextAlign.center,
          ),

          Image.asset('space.png'),

          Divider(
            height: 50,
            color: Colors.grey[800],
            indent: 10,
            endIndent: 10,
          ),
          
          Container(
            color: Colors.grey[800],
            padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0), // use p in the run terminal to see what this does.
            margin: EdgeInsets.fromLTRB(10, 20, 20, 10), // Padding has its own widget but it won't allow defining a margin or color.  
            
            child: Icon(
              Icons.airport_shuttle,
              color: Colors.blue,
              size: 200.0,
            ),
          ),
          
          Divider(
            height: 50,
            color: Colors.grey[800],
            indent: 10,
            endIndent: 10,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container( // Clicking on a widget and selecting the lightbulb gives you a bunch of quick actions you can take. 
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                child: ElevatedButton(
                  onPressed: () {handleClick();},
                  child: Text('Click me.'),
              )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                child: ElevatedButton.icon(
                    onPressed: () {handleClick(text: ':+)');}, 
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

                ), 
              )
            ] 
          ),

          Container(
            // Treat this container like a playground. 
            margin: EdgeInsets.all(2),
            height: 500,
            width: 500,
            decoration: BoxDecoration(
              border: BoxBorder.all(
                width: 1, 
                color: (Colors.grey[800])!,
                /* 
                - If you check the BoxBorder properties, color: is defined using "Color", *not* "Color?". 
                - The property cannot be null. ()! allows the value to be null if you're sure it won't be. 
                - Can also use Colors.grey.shade400 which seems to build it in. Should probs stick to that. 
                */
              )
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround, // seems like Exanded() is overriding this by taking up all available space. 
              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                Expanded(
                  /*
                  - Flex value is the fraction of space the widget will use up. 
                  - 1+2+3=6. Available space inside Row() is divided into 6 portions. Number of portions given to each widget is their flex value. 1 uses 1/6 Row(), 2: 2/6 Row(): 3: 3/6 Row()
                  - Useful for scaling images in limited space. Just replace a Text() child with Image.asset('space.png')
                  */
                  flex: 1,

                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(left: 2),
                    color: Colors.red,
                    child: Text('1'),                
                  ),
                ),
                Expanded(
                  flex: 2,  

                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(left: 2),
                    color: Colors.green,
                    child: Text('2'),
                  ),
                ),
                Expanded(
                  flex: 3, 

                  child: Container(
                    // Container decorations should all be specified here for more control. color: property is shorthand.
                    decoration: BoxDecoration(
                      color: Colors.blue, 
                      border: BoxBorder.all(
                        width: 1,
                        color: Colors.grey.shade400,
                      ),
                      borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
                    ),
                    
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(left: 2, right: 2),
                    child: Text('3'),
                  ),
                ),
              ],
            ),
          ),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue[600],
        // Pro tip: Hover over a widget to see its possible properties. The "child" property lets us nest widgets.
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

          child: Text(
            'floating action button', 
            textScaler: TextScaler.linear(0.6),
            textAlign: TextAlign.center, // found in docs. When you don't know what a property takes, try a class of the same name. 
            // ^ This one confused me because I thought I had to wrap it in a center wgt first but it happened to have a property that also does that.
            style: TextStyle(
              color: Colors.white,
            ) 
          ),
        ), 
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}