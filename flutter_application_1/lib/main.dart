import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() { runApp(MaterialApp(
  // Widgets have properties. The values of these can be other widgets or something else. 
  // "home" is a property of MaterialApp(). We're calling our own custom widget below.
  home: Home(),
));} 

//// Stateless Widgets ////
class Demo extends StatelessWidget {
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

void handleClick({String text = ':3'}) {
  // Got a warning when trying just print('thanks') because it won't work well in production. 
  if(kDebugMode) {
    debugPrint(text);
  }
}

class Home extends StatefulWidget {
  // Was stateless. I used the quick action menu to convert it to stateful. 
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String clickSmiley = '';

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
          
          Divider(
            height: 50,
            color: Colors.grey[800],
            indent: 10,
            endIndent: 10,
          ),

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

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container( // Clicking on a widget and selecting the lightbulb gives you a bunch of quick actions you can take. 
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: ElevatedButton(
                    onPressed: () {
                      handleClick(text: ':3');
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
                      handleClick(text: '>:3');
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

          ListsOfData()
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}


// used stful to get the skeleton classes. 
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyWidgetState();
  // This line instantiates the state class below. 
}

class _MyWidgetState extends State<MyStatefulWidget> {
  // Here's where we define data that can change the state over time. 
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
    // returns a widget tree just like Home().
  }
}

class ListsOfData extends StatefulWidget {
  const ListsOfData({super.key});

  @override
  State<ListsOfData> createState() => _ListsOfDataState();
}

class _ListsOfDataState extends State<ListsOfData> {

  List<String> quotes = [
    "cash is cool",
    "it's too hot",
    "my head hurts"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),

      child: Column(
        // .map operates on each item in the list and expects a function. We've defined that function as returning a text widget
        // Then we convert the whole operation to a list because children: expects that. 
        children: quotes.map( (quote) {return Text(quote);} ).toList()
      ),
    );
  }
}