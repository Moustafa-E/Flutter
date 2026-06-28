import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/request.dart';
import 'dart:math';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getRequest() async {
    int random = Random().nextInt(11) + 1;
    JsonRequest requestInstance = JsonRequest(number: random);
    await requestInstance.getData(); // await has two conditions: 1) use inside an async function and 2) use on a method with a future (if statement includes a function)
    // must await getData() above because it's asynchronous. Can't await inside a synchronous function, which is why we didn't call this driectly in initState()
    
    Navigator.pushReplacementNamed(
      // Ahhh - this won't just put home on top but replace it. Nice. Third argument will send data to the page too. 
      context, '/home', // TODO: Rebuild. I think this is why I'm seeing problems with hot restart. context, /home will run the build() method for home before the Model arguments are ready. 
      arguments: {
      // keys are the variable names to be set in next page
        'result': requestInstance.data,
        'isAbove5': requestInstance.isAbove5
      }
    );
  }

  @override
  void initState() {
    print('>> Loading() initState()');
    super.initState();
    getRequest();
  }

  @override
  Widget build(BuildContext context) {
    print('>> Loading() build() ran');
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: Center(
        child: SpinKitRotatingCircle(
          // found on pub.dev doc page. Rotating circle, fading cube etc are all there.
          color: Colors.white,
          size: 50.0,
        )
      )
    );
  }
}