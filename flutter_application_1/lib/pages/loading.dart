import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    Response response = await get(url);
    // Response type given by http. Contains info about response. Body is what we want.
    print(response.body);
    // This body will look a map but it's actually just a string. 
    // Can't call fields in there directly, so response.body.userId won't work. Must first convert:
    Map data = jsonDecode(response.body);
    print('UserID: ${data['userId']}');
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}