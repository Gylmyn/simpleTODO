import 'package:flutter/material.dart';

import '../model/todo.dart';

class TodoList with ChangeNotifier {
  List<TodoData> _todoList = [];

  List<TodoData> get todoList => _todoList;

  void addTodo(TodoData todo) async {
    _todoList.add(todo);
    notifyListeners();
  }

  void removeTodo(TodoData todo) {
    _todoList = _todoList.where((item) => item.id != todo.id).toList();
    notifyListeners();
  }

  void updateTodo(TodoData todo) {
    _todoList[_todoList.indexWhere((item) => item.id == todo.id)] = todo;
    notifyListeners();
  }
}
