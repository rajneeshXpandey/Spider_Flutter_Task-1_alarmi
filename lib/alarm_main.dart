import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'Flutter Demo',
      theme: ThemeData(
          backgroundColor: Color(0xff2D2F41),
//        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Alarm App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool switch_value = false;

  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay picked;

  DateTime _dateTime = DateTime.now();
  Timer _timer;

  var alarmId = 0;

  bool play = true;
  int flag = 0;



  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
      _timer = Timer(
        Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );


      if(_dateTime.minute == _time.minute && _dateTime.hour == _time.hour && flag==0 && switch_value) {
        print(play);
        flag++;
        if (flag==1) {
          FlutterRingtonePlayer.playRingtone();
        }
        //this.play = false;
      }
      else if(_dateTime.minute != _time.minute || _dateTime.hour != _time.hour) {
        FlutterRingtonePlayer.stop();
        flag = 0;
      }
    });
  }


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2D2F41),
      body: Container(
             color:   Color(0xff2D2F41) ,
          padding: EdgeInsets.only(top: 20),
          child: Expanded(

            child: Card(

              color: Color(0xff2499B8),
              shadowColor:Colors.cyanAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                leading: Icon(Icons.timer,color: Colors.white,),
                title: GestureDetector(
                  child: Text(
                    "${_time.hour}:${_time.minute}",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  onTap: () {
                    selectTime(context);
                  },
                ),
                subtitle: Text(
                  "Cycle: Every Day",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                          color: Colors.white
                  ),
                ),
                trailing: Switch(
                  value: switch_value,
                  onChanged: (bool state) {
                    setState(() {
                      this.switch_value = state;
                      print(switch_value);
                      if(switch_value)
                        FlutterRingtonePlayer.playRingtone();
                      else
                        FlutterRingtonePlayer.stop();
                    });
                  },
                ),
              ),
              elevation: 100,
            ),
          )
      ),

    );
  }

  Future<Null> selectTime(BuildContext context) async {
    picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );

    if(picked != null && picked != _time) {
      setState(() {
        _time = picked;
      });
    }
  }

  Future<Null> alarm(BuildContext context) async {
    print("hello");
    await AndroidAlarmManager.periodic(const Duration(minutes: 1), alarmId, printHello);
  }

  void printHello() {
    final DateTime now = DateTime.now();
    final int isolateId = Isolate.current.hashCode;
    print("[$now] Hello, world! isolate=${isolateId} function='$printHello'");
  }

}