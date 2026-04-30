import 'package:flutter/material.dart';

class TaskProviders extends ChangeNotifier {
  final List<String> _tasks = [];
  List<String> get task => _tasks;

  void addTask(String task) {
    _tasks.add(task);
    notifyListeners();
  }
}
