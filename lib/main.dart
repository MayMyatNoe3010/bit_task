import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:bit_task/core/utils/app_routes.dart';
import 'package:bit_task/core/utils/constants.dart';
import 'package:bit_task/features/to_do/presentation/ui/page/home_page.dart';
import 'package:bit_task/features/to_do/presentation/ui/page/new_task_page.dart';
import 'core/base_widgets/bottom_navigation_widget.dart';
import 'core/services/notification_services.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //await Future.delayed(const Duration(seconds: 3));
  await Supabase.initialize(
    url: Constants.SUPABASE_URL,
    anonKey: Constants.SUPABASE_ANON_KEY,
  );
  //await Firebase.initializeApp();

  await NotificationServices.initializeNotifications(
    onNotificationTap: (payload) {
      if (payload == Constants.goHome) {
        navigatorKey.currentState?.pushNamedAndRemoveUntil(
          AppRoutes.home,
          (route) => false,
        );
      }
    },
  );
  print('Main');
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('MyApp');
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      routes: {
        AppRoutes.home: (context) => HomePage(),
        AppRoutes.newTask: (context) => NewTaskPage(),
      },

      home: BottomNavigationWidget(),
    );
  }
}
