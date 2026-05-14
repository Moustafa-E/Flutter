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
    This lets the app hot reload on its own because Flutter will rerun build() when a change is detected... at least in Android Studio
    - Stateless: widget state cannot change during runtime
    - Stateful: widget state can change during runtime 
  */
  @override // Parent has its own build() function. We're just overriding it.
  Widget build(BuildContext context) {
    return Container();
    // build() function will return the Container() widget & any children. Can contain any widget so we'll return what we built (was previously directly in the Home property in main())
      
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // "appBar" is a property of Scaffold().
      appBar: AppBar(
        // title is a property of AppBar(). Display text using the Text() widget.
        title: Text('title'),
        backgroundColor: Colors.red[600], 
        // Since we're inside the MaterialApp wgt, you have access to various Material Design Properties by google. 
        // Learn more about that here: https://m3.material.io/. Square brackets is the strength.
      ),
      body: Center(
        // Think "child" as a generic property for any widget. So far we've just used specific default ones.
        child: Text(
          'centered body',
          style: TextStyle( // follows CSS convention for styling text. Specify style, then within that style specify things like color.
            fontSize: 20.0,
            fontWeight: FontWeight.bold, // A bit weird here. FontWeight treated as a "class" that isn't quite a widget. Kinda like Colors.red. Perhaps, generally speaking, widgets will "contain" something, whereas raw classes will "change" something.
            color: Colors.grey[600],
            fontFamily: 'FiraCode',
            /* Grab a font from google, extract the zip and put the font file in some directory you can refer to. 
            Go to pubspec.yaml, add the font family & asset, then run "flutter pub get" 
            Quit and start the app again. Hot restart didn't work. */
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red[600],
        // Pro tip: Hover over a widget to see its possible properties.
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
    );
  }
}