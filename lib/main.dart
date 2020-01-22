import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/blocs/bloc_provider.dart';
import 'package:todo_app/blocs/todo_bloc.dart';
import 'screens/add_task_dialog.dart';
import 'widgets/custom_rounded_button.dart';

import 'models/task.dart';
import 'widgets/icon_counter.dart';

void main() => runApp(BlocProvider<TodoBloc>(
      bloc: TodoBloc(),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: Color.fromRGBO(42, 44, 65, 1),
          accentColor: Colors.white,
          accentTextTheme: GoogleFonts.molengoTextTheme(),
          primaryTextTheme: GoogleFonts.cabinTextTheme(),
        ),
        home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final todoBloc = BlocProvider.of<TodoBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('TO DO',
            style: Theme.of(context)
                .primaryTextTheme
                .title
                .apply(color: Theme.of(context).accentColor)),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: StreamBuilder<int>(
              initialData: 0,
              stream: todoBloc.outTotalTasksCount,
              builder: (BuildContext context, snapshot) {
                var total = snapshot.data;
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Transform.scale(
                    scale: 1.4,
        origin: Offset(0.0, 0.0),
                                      child: IconCounter(
                      counter: total,
                      iconData: Icons.event_note,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: <Widget>[
            Expanded(
              child: StreamBuilder<List<Task>>(
                stream: todoBloc.stream,
                builder: (context, snapshot) {
                  List<Task> taskList = snapshot.data;
                  return ListView.builder(
                    itemCount: (taskList == null ? 0 : taskList.length),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 7,
                        margin: EdgeInsets.all(14),
                        child: ListTile(
                          title: Text(
                            '${taskList[index].description}',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .body1
                                .apply(fontSizeFactor: 1.5),
                          ),
                          trailing: IconButton(onPressed: (){
                            todoBloc.removeTask(taskList[index]);
                          },icon: Icon(Icons.delete), ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(14),
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(blurRadius: 6, color: Colors.black45)
                ], borderRadius: BorderRadius.circular(100)),
                child: CustomRoundedButton(
                  onTap: () {
                    showSimpleCustomDialog(context);
                  },
                  icon: Icon(
                    Icons.add,
                    color: Theme.of(context).accentColor,
                    size: 44,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showSimpleCustomDialog(BuildContext context) {
    Dialog simpleDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: AddTaskDialog(),
    );
    showDialog(
        context: context, builder: (BuildContext context) => simpleDialog);
  }
}

