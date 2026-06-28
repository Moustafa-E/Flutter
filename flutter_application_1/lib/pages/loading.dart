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
    await requestInstance.getData(); // await has two conditions: 1) use inside an async function and 2) use on a statement with a future (if statement includes a function)
    // must await getData() above because it's asynchronous. Can't await inside a synchronous function, which is why we didn't call this driectly in initState()
    Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(
      // Ahhh - this won't just put home on top but replace it. Nice. Third argument will send data to the page too. 
      context, 
      '/home', 
      arguments: {
      // keys are the variable names to be set in next page
        'result': requestInstance.data,
        'isAbove5': requestInstance.isAbove5
      }
    );
  }

  @override
  void initState() {
    super.initState();
    getRequest();
  }

  @override
  Widget build(BuildContext context) {
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