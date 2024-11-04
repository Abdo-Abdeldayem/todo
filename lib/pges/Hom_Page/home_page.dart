import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/Util/dialog_box.dart';
import 'package:todo/Util/todo_tile.dart';
import 'package:todo/data/database.dart';
// import 'package:conditional_builder/conditional_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // referance the box
  final _mybox = Hive.box('mybox');
  TodoDatabase db = TodoDatabase();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // there are already the data
    if (_mybox.get('TODOLIST') != null) {
      db.loadData();
    }

    super.initState();
  }

  final TextEditingController _controller = TextEditingController();

  // checkbox was tapped
  void checkBoxChanged(bool? vale, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updataDta();
  }

  // scrollToLastItem

  void _scrollToLastItem() {
    if (db.toDoList.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      });
    }
  }

  // save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      Navigator.pop(context);
      _controller.clear();
    });
    db.updataDta();
    _scrollToLastItem();
  }

  // create a new task
  void creatNewTask() {
    showDialog(
        context: context,
        builder: (context) => DialogBox(
              controler: _controller,
              onSave: saveNewTask,
              onCancel: () => Navigator.of(context).pop(),
            ));
  }

  // delete a task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updataDta();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('TO DO'),
        elevation: 0,
      ),
      body: ConditionalBuilder(
          condition: db.toDoList.isEmpty,
          builder: (context) => const Center(
                child: Text(
                  'Create your first task',
                  style: TextStyle(
                    color: Colors.black45,
                  ),
                ),
              ),
          fallback: (context) => ListView.builder(
                controller: _scrollController,
                itemCount: db.toDoList.length,
                itemBuilder: (context, index) => ToDoTile(
                  taskName: db.toDoList[index][0],
                  taskCompleted: db.toDoList[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                  deleteFunction: (context) => deleteTask(index),
                ),
              )),
      floatingActionButton: FloatingActionButton(
        onPressed: creatNewTask,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Dispose of the ScrollController
    super.dispose();
  }
}
