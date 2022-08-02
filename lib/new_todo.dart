import 'dart:html';

import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({Key? key}) : super(key: key);

  @override
  _NewTodoState createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  String title = '';
  String? description = 'No Todo description';

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new todo'),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Todo Title',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please input a Todo item title';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      title = value ?? 'No title given';
                    });
                  },
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Todo description',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    setState(() {
                      description = value;
                    });
                  },
                ),
                SizedBox(
                  height: 5.0,
                ),
                ElevatedButton(
                  child: Text('SUBMIT'),
                  onPressed: () {
                    final isValid = formKey.currentState!.validate();

                    if (isValid) {
                      formKey.currentState?.save();
                      // todos.add(Todo(title: title, description: description));
                      Navigator.pop(context, Todo(title: title, description: description));
                    }
                  },
                ),
              ],
            ),
          )),
    );
  }
}
