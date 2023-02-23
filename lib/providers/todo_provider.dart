import 'package:api_call_using_provider/services/todo_service.dart';
import 'package:flutter/material.dart';

import '../models/todo.dart';

class TodoProvider with ChangeNotifier {
  final _service = TodoService();
  bool isLoading = false;
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;
  Future<void> getAllTodos() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getTodos();
    _todos = response;
    isLoading = false;
    notifyListeners();
  }

  void isCompleted(Todo todo) {
    todos.remove(todo);
    notifyListeners();
  }
}
