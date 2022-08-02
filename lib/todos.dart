import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';

class Todos extends StatefulWidget {
  const Todos({Key? key}) : super(key: key);

  @override
  _TodosState createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  List<Todo> todoList = todos;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
          child: Card(
            child: ListTile(
              title: Text(
                todoList[index].title,
                style: TextStyle(
                  decoration: todoList[index].done == true ? TextDecoration.lineThrough : null,
                  color: todoList[index].done == true ? Colors.grey[500] : Colors.black,
                ),
              ),
              trailing: Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        todoList.remove(todoList[index]);
                      });
                    },
                    icon: Icon(Icons.delete),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        todoList[index].done = !todoList[index].done;
                      });
                    },
                    icon: todoList[index].done == true ? Icon(Icons.refresh) : Icon(Icons.done),
                  )
                ],
              )
            ),
          ),
        );
      },
    );
  }
}
