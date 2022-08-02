import 'package:flutter/material.dart';
import 'package:todo_list/todos.dart';
import 'package:todo_list/models/todo.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Todo> todoList = todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Column(
          children: [
            Center(
              child: ElevatedButton.icon(
                icon: Icon(Icons.add),
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/new_todo');
                  setState(() {
                    todoList.add(result);
                  });
                },
                label: Text('Add todo'),
              ),
            ),
            Expanded(child: Todos()),
          ],
        ),
      ),
    );
  }
}
