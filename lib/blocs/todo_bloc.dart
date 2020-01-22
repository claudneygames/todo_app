import 'dart:collection';

import 'package:rxdart/rxdart.dart';
import 'package:todo_app/blocs/bloc_provider.dart';
import 'package:todo_app/models/task.dart';

class TodoBloc implements BlocBase {

  /// List of tasks from todo list
  List<Task> _taskList = List();

  /// Controls the task list stream
  BehaviorSubject<List<Task>> _tasksController =
      new BehaviorSubject<List<Task>>();
  Stream<List<Task>> get stream => _tasksController.stream;

  /// Controls the insertion of a new Task
  BehaviorSubject<Task> _addTaskController = new BehaviorSubject<Task>();
  Sink<Task> get inAddTask => _addTaskController.sink;


  /// Controls the stream for number of total tasks created
  BehaviorSubject<int> _taskListTotalCountController = new BehaviorSubject<int>();
  Stream<int> get outTotalTasksCount => _taskListTotalCountController.stream;


  TodoBloc() {
    _addTaskController.listen(_handleAddTask);
  }

  void removeTask(Task task){
    _taskList.remove(task);

    notify();
  }
  @override
  void dispose() {
    _tasksController.close();
    _addTaskController.close();
    _taskListTotalCountController.close();
  }

  void _handleAddTask(Task task) {
    _taskList.add(task);
    notify();
  }

  void notify() {
    _tasksController.add(UnmodifiableListView(_taskList));

    _taskListTotalCountController.add(_taskList.length);
  }
}
