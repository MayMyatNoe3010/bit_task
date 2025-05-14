import 'dart:developer';

import 'package:bit_task/core/base_widgets/async_data_handler.dart';
import 'package:bit_task/features/to_do/presentation/providers/task_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bit_task/core/utils/app_routes.dart';
import 'package:bit_task/features/to_do/presentation/ui/component/calendar_widget.dart';
import 'package:bit_task/features/to_do/presentation/ui/component/to_do_list_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/res/dimensions.dart';
import '../../../domain/entities/task.dart';
import '../component/user_info_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();

  // List<Task> toDoList = [Task(title: 'title', note: "note", startTime: 'startTime', endTime: 'endTime', reminderTime: 10),
  //   Task(title: 'title', note: "note", startTime: 'startTime', endTime: 'endTime', reminderTime: 10),
  //   Task(title: 'title', note: "note", startTime: 'startTime', endTime: 'endTime', reminderTime: 10),
  // ];
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Init');
    Future.microtask(() {
      ref.read(taskProvider.notifier).getTasks(DateTime.now().toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    final toDos = ref.watch(taskProvider);

    return Scaffold(
      // backgroundColor: Colors.blue,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(Dimensions.paddingM),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              toDos.when(
                data:
                    (tasks) => UserInfoWidget(
                      totalTodo: tasks.length,
                      userName: 'MMN',
                    ),
                loading: () => const CircularProgressIndicator(),
                error: (e, _) => Text('Error: $e'),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: Dimensions.marginM),
                child: CalendarWidget(),
              ),
              Expanded(
                flex: 1,
                child: AsyncDataHandler<List<Task>>(
                  value: toDos,
                  onData: (context, tasks) => ToDoListWidget(todoList: tasks),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //RouteManager.goTo(context, NewTaskPage());
          Navigator.pushNamed(context, AppRoutes.newTask);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
