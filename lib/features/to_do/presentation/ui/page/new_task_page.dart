import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bit_task/core/base_widgets/drop_down_widget.dart';
import 'package:bit_task/core/base_widgets/switch_widget.dart';
import 'package:bit_task/core/base_widgets/text_field_widget.dart';
import 'package:bit_task/core/base_widgets/time_picker_widget.dart';

import '../../../../../core/base_models/drop_down_model.dart';
import '../../../../../core/res/dimensions.dart';
import '../../../../../core/res/strings.dart';
import '../../../../../core/services/notification_services.dart';
import '../../../../../core/services/supabase_services.dart';
import '../../../domain/entities/task.dart';

class NewTaskPage extends StatefulWidget {
  final tecTitle = TextEditingController();
  final tecNotes = TextEditingController();
  late DateTime startTime, endTime;

  String reminder = '';
  bool isRepeat = false;

  NewTaskPage({super.key});

  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  int reminderInt = 0;

  //NotificationUtils notificationUtils = NotificationUtils();

  final supabaseService = SupabaseService();

  @override
  void initState() {
    // notificationUtils.checkPermissionNotification(context);
    // notificationUtils.startListeningNotificationEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Strings.lbNewTask)),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(Dimensions.paddingM),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldWidget(tec: widget.tecTitle, label: Strings.lbTitle),
              TextFieldWidget(tec: widget.tecNotes, label: Strings.lbNote),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: Dimensions.marginS,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TimePickerWidget(
                        label: Strings.lbStartTime,
                        callback: (start) {
                          widget.startTime = start;
                          log(widget.startTime.toString(), name: 'StartTime');
                        },
                      ),
                    ),
                    SizedBox(width: Dimensions.marginS),
                    Expanded(
                      flex: 1,
                      child: TimePickerWidget(
                        label: Strings.lbEndTime,
                        callback: (end) {
                          widget.endTime = end;
                          log(widget.endTime.toString(), name: 'EndTime');
                        },
                      ),
                    ),
                  ],
                ),
              ),

              DropDownWidget(
                selectedCallback: (value) {
                  widget.reminder = '$value';
                  reminderInt = int.parse(widget.reminder);
                },
                hint: 'Please select for alarm before task',
                itemList: [
                  DropDownItem(name: '10 mins', id: 10),
                  DropDownItem(name: '15 mins', id: 15),
                ],
              ),
              SwitchWidget(
                title:
                    widget.isRepeat
                        ? 'Disable daily reminder'
                        : 'Enable daily reminder',
                onClickCallback: (bool value) {
                  widget.isRepeat = value;
                },
              ),
              Spacer(),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    Task todo = Task(
                      title: widget.tecTitle.text,
                      note: widget.tecNotes.text,
                      startTime: widget.startTime.toString(),
                      endTime: widget.endTime.toString(),
                      reminderTime: reminderInt,
                      isRepeated: widget.isRepeat,
                      isComplete: false,
                    );
                    //await DataService.createNewTodo(todo);
                    // await supabaseService.addTodo(todo, 1);
                    //notificationUtils.createScheduleNotification();
                    NotificationServices.showReminderNoti(todo);
                    Navigator.pop(context);
                  },
                  child: Text(Strings.lbCreateTask),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
