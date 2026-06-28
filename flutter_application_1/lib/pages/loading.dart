import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/request.dart';
import 'package:flutter_application_1/widgets/nav_bar.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String result = 'loading';

  void getRequest() async {
    JsonRequest requestInstance = JsonRequest(number: 2);
    await requestInstance.getData(); // await has two conditions: 1) use inside an async function and 2) use on a statement with a future (if statement includes a function)
    // must await getData() above because it's asynchronous. Can't await inside a synchronous function, which is why we didn't call this driectly in initState()
    setState(() {
      result = requestInstance.data;
    });
  }

  @override
  void initState() {
    super.initState();
    getRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Column(
          children: [
            NavBar(),
            Text(result),
          ],
        ),
      )
    );
  }
}