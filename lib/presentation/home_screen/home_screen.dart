import 'package:flutter/material.dart';
import 'package:todo_app/presentation/home_screen/widget/todo_tile.dart';

class ToDoItem {
  String taskName;
  bool isComplete;

  ToDoItem({required this.taskName, this.isComplete = false});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  final _controller = TextEditingController();
  List<ToDoItem> toDoList = [];

  void checkBoxChange(int index, bool? value) {
    setState(() {
      toDoList[index].isComplete = value ?? false;
    });
  }

  void saveNewTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        toDoList.add(ToDoItem(taskName: _controller.text));
        _controller.clear();
      });
    }
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text(
          'To Do App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: ClipOval(
              child: Material(
                color: Theme.of(context).colorScheme.secondary,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/account');
                  },
                  child: const SizedBox(
                    height: 42,
                    width: 42,
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          // return TodoTile(
          //   id: "",
          //   taskName: toDoList[index].taskName,
          //   onChanged: (value) {
          //     checkBoxChange(index, value);
          //   },
          //   deleteFunction: (p0) => deleteTask(index),
          // );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w500),
                  controller: _controller,
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  decoration: InputDecoration(
                    hintText: 'Add new todo items...',
                    hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.primary,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              backgroundColor:
                  Theme.of(context).floatingActionButtonTheme.backgroundColor,
              onPressed: saveNewTask,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
