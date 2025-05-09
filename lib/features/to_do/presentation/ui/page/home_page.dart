import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bit_task/core/utils/app_routes.dart';
import 'package:bit_task/features/to_do/presentation/ui/component/calendar_widget.dart';
import 'package:bit_task/features/to_do/presentation/ui/component/no_task_widget.dart';
import 'package:bit_task/features/to_do/presentation/ui/component/to_do_list_widget.dart';
import 'package:bit_task/features/to_do/presentation/ui/page/new_task_page.dart';

import '../../../../../core/base_widgets/custom_horizontal_calendar.dart';
import '../../../../../core/res/dimensions.dart';
import '../../../data/models/task.dart';
import '../component/user_info_widget.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
    List<Task> toDoList = [Task(title: 'title', note: "note", startTime: 'startTime', endTime: 'endTime', reminderTime: 10),
      Task(title: 'title', note: "note", startTime: 'startTime', endTime: 'endTime', reminderTime: 10),
      Task(title: 'title', note: "note", startTime: 'startTime', endTime: 'endTime', reminderTime: 10),
    ];
  @override
  Widget build(BuildContext context) {
    print('Home');

    return Scaffold(
     // backgroundColor: Colors.blue,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(Dimensions.paddingM),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              UserInfoWidget(totalTodo: toDoList.length, userName: 'MMN',),
              Container(
                margin: EdgeInsets.symmetric(vertical: Dimensions.marginM),
                  child: CalendarWidget()),
              Expanded(
                flex: 1,
                  child: ToDoListWidget(todoList: toDoList)),
            ],
          ),
        ),

      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        //RouteManager.goTo(context, NewTaskPage());
        Navigator.pushNamed(context, AppRoutes.newTask);
      },child: Icon(Icons.add),),
    );
  }
}
