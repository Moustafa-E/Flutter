import 'package:flutter/material.dart';

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