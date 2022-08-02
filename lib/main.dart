import 'package:flutter/material.dart';
import 'package:todo_list/home.dart';
import 'package:todo_list/new_todo.dart';

void main() {
  runApp(MaterialApp(
    routes: {
    '/': (context) => Home(), 
    '/new_todo': (context) => NewTodo(),
    },
  ));
}
