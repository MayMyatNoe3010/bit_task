import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:bit_task/core/utils/app_routes.dart';
import 'package:bit_task/core/utils/constants.dart';
import 'package:bit_task/features/to_do/presentation/ui/page/home_page.dart';
import 'package:bit_task/features/to_do/presentation/ui/page/new_task_page.dart';
import 'core/base_widgets/bottom_navigation_widget.dart';
import 'core/services/notification_services.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  //await Future.delayed(const Duration(seconds: 3));
  await Supabase.initialize(
    url: Constants.SUPABASE_URL,
    anonKey: Constants.SUPABASE_ANON_KEY,
  );
  //await Firebase.initializeApp();

  await NotificationServices.initializeNotifications();
  print('Main');
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('MyApp');
    return MaterialApp(
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
