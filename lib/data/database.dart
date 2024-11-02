import 'package:hive/hive.dart';

class TodoDatabase {
  List toDoList = [];

  // referance the box
  final _mybox = Hive.box('mybox');

  // load the data from database
  void loadData() {
    toDoList = _mybox.get('TODOLIST');
  }

  // updata the database
  void updataDta() {
    _mybox.put('TODOLIST', toDoList);
  }
}
