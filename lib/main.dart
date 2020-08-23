import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:ui';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  var initializationSettingsAndroid =
  AndroidInitializationSettings('ic_launcher');
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {});
  var initializationSettings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
        if (payload != null) {
          debugPrint('notification payload: ' + payload);
        }
      });
  runApp(AlarMe());
}

class AlarMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:   Color(0xff2D2F41)  ,
        scaffoldBackgroundColor:  Color(0xff2D2F41),
        textTheme: TextTheme( headline2: TextStyle(color: Colors.cyanAccent),
           bodyText1: TextStyle(color: Colors.cyanAccent),
           bodyText2: TextStyle(color: Colors.cyanAccent)),
          appBarTheme: AppBarTheme(
            textTheme: TextTheme(headline1: TextStyle( color:Colors.cyanAccent),),
            iconTheme: IconThemeData(color:  Colors.cyanAccent)
          )
      ),

        home:Tabs()

    );
  }

  }
