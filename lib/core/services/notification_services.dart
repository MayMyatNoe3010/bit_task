import 'package:bit_task/core/extensions/date_extension.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:bit_task/core/utils/constants.dart';

import '../../features/to_do/domain/entities/task.dart';


class NotificationServices {
  static final FlutterLocalNotificationsPlugin _localNotiPlugin =
      FlutterLocalNotificationsPlugin();

  //static final onDidReceiveNotificationResponse = BehaviorSubject<String>();
  static Future<void> initializeNotifications({
    void Function(String? payload)? onNotificationTap,
  }) async {
    tz.initializeTimeZones();
    var androidInitialization = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        );
    var initializationSettings = InitializationSettings(
      android: androidInitialization,
      iOS: iosSettings,
    );

    await _localNotiPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        if (onNotificationTap != null) {
          onNotificationTap.call(response.payload);
        }
      },
    );
  }

  static Future<void> showReminderNoti(Task task) async {
    const androidDetails = AndroidNotificationDetails(
      Constants.task_reminder_channel,
      'Task Reminder',
      importance: Importance.max,
      priority: Priority.high,
    );

    var platformDetails = NotificationDetails(android: androidDetails);
    tz.TZDateTime tzDateTime = DateTime.parse(
      task.startTime,
    ).getTZTime(task.reminderTime);
    if (task.isRepeated) {
      await _localNotiPlugin.zonedSchedule(
        task.id ?? 0, // Notification ID
        'Reminder',
        'Your task "${task.title}" is due in ${task.reminderTime} minutes!',
        tzDateTime,
        platformDetails,
        matchDateTimeComponents: DateTimeComponents.time,
        // Repeat every day at the same time
        androidScheduleMode: AndroidScheduleMode.alarmClock,
        // Repeat every 24 hours
        payload: Constants.goHome,
      );
      print('pushNoti Repeated $tzDateTime');
    } else {
      await _localNotiPlugin.zonedSchedule(
        0,
        'Reminder',
        'Your task "${task.title}" is due in ${task.reminderTime} minutes!',
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'your channel id',
            'your channel name',
            channelDescription: 'your channel description',
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        payload: Constants.goHome,
      );

      // await _localNotiPlugin.zonedSchedule(
      //   task.id ?? 0,  // Notification ID
      //   'Reminder',
      //   'Your task "${task.title}" is due in ${task.reminderTime} minutes!',
      //   tzDateTime,
      //   platformDetails, androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      //
      // );
      print('pushNoti not Repeated $tzDateTime');
    }
  }

  static Future cancel(int id) async {
    await _localNotiPlugin.cancel(id);
  }

  static Future cancelAll() async {
    await _localNotiPlugin.cancelAll();
  }
}
