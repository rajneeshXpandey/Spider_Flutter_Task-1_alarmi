import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'dart:ui';

import 'package:android_alarm_manager/android_alarm_manager.dart';



void main() async{

  runApp(AlarMe());
  await AndroidAlarmManager.initialize();

  print("AndroidAlarmManager initialized!");
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
