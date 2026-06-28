import 'package:http/http.dart';
import 'dart:convert';

class JsonRequest {
  final int number;
  String data = "";
  
  JsonRequest({required this.number});

  Future<void> getData() async {
    // Since we're awaiting this async function elsewhere, we must have it be of type Future<void>. Can only await functions with a future. A future in dart is a promise in JS
    // See this error: Uses 'await' on an instance of 'void', which is not a subtype of 'Future'. https://dart.dev/diagnostics/await_only_futures

    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/todos/${number.toString()}');
    Response response = await get(url);
    // Response type given by http. Contains info about response. Body is what we want.
    print(response.body);
    // This body will look a map but it's actually just a string. 
    // Can't call fields in there directly, so response.body.userId won't work. Must first convert:
    Map body = jsonDecode(response.body);
    data = 'UserID: ${body['title']}';
  }
}