class Todo {
  String title;
  String? description = '';
  bool done = false;

  Todo({required this.title, this.description});

  void add() {
    todos.add(this);
  }

  void delete() {
    todos.remove(this);
  }
}

List<Todo> todos = [
  Todo(title: 'Wake up', description: 'it is time to wake up'),
  Todo(title: 'Brush teeth', description: 'it is time to brush teeth'),
  Todo(title: 'Brush teeth', description: 'it is time to brush teeth'),
  Todo(title: 'Brush teeth', description: 'it is time to brush teeth'),
];
