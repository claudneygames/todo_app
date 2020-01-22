import 'package:flutter/material.dart';
import 'package:todo_app/blocs/bloc_provider.dart';
import 'package:todo_app/blocs/todo_bloc.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/widgets/custom_rounded_button.dart';
import 'package:todo_app/widgets/custom_text_field.dart';

class AddTaskDialog extends StatefulWidget {
  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  var todoBloc;
  TextEditingController _textEditingController = TextEditingController();

  void _addTask() {
    if (_textEditingController.text.isNotEmpty) {
      Task task = Task(_textEditingController.text);
      todoBloc.inAddTask.add(task);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    todoBloc = BlocProvider.of<TodoBloc>(context);
    return Container(
      height: 300,
      child: Column(
        children: <Widget>[
          Expanded(
                      child: SimpleTextField(
              textEditingController: _textEditingController,
            ),
          ),
          CustomRoundedButton(
                  onTap: () {
                    _addTask();
                  },
                  color: Colors.green,
                  icon: Icon(
                    Icons.check,
                    color: Theme.of(context).accentColor,
                    size: 37,
                  ),
                ),
                SizedBox(height: 12,)

        ],
      ),
    );
  }
}