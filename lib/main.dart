import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoHomePage(),
    );
  }
}

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  _TodoHomePageState createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  // List to store tasks
  final List<String> _todos = [];

  // Controller to manage the text input
  final TextEditingController _controller = TextEditingController();

  // Function to add a task
  void _addTodo() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _todos.add(_controller.text);
      });
      _controller.clear(); // Clear the input field after adding
    }
  }

  // Function to remove a task
  void _removeTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App_by@HImanshu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            // Input field for adding tasks
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter a task...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // Button to add task
            ElevatedButton(
              onPressed: _addTodo,
              child: Text('+Add Todo+'),
            ),
            SizedBox(height: 20),
            // List of tasks
            Expanded(
              child: ListView.builder(
                itemCount: _todos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_todos[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _removeTodo(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
