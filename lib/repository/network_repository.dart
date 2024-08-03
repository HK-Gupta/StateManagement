import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkRepository {
  final http.Client client = http.Client();

  Future<List<dynamic>> getTodos() async {
    try {
      final response = await client
          .get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));

      if(response.statusCode==200) {
        List<dynamic> todoList = json.decode(response.body);

        return todoList;
      } else {
        return [];
      }
    } catch(_) {
      print("Something went wrong");
      return [];
    }
  }
}