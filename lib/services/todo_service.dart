import 'dart:convert';

import 'package:api_call_using_provider/models/todo.dart';
import 'package:http/http.dart' as http;

class TodoService {
  Future<List<Todo>> getTodos() async {
    const url = 'https://jsonplaceholder.typicode.com/todos';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final todos = json.map((todo) {
        return Todo(
            id: todo['id'],
            userId: todo['userId'],
            title: todo['title'],
            completed: todo['completed']);
      }).toList();
      return todos;
    }
    return [];
  }
}
