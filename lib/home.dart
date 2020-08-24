import 'package:flutter/material.dart';

import 'time.dart' as time;
import 'alarm_main.dart' as alarm;
import 'stopwatch.dart' as stopwatch;
import 'timer.dart' as timer;


class Tabs extends StatefulWidget{
  @override
  TabsState createState() => new TabsState();
}

class TabsState extends State<Tabs> with SingleTickerProviderStateMixin{

  TabController controller;

  @override
  void initState(){
    super.initState();
    controller = new TabController(vsync: this, length: 4);
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
        appBar: new AppBar(
            elevation: 100,
            shadowColor: Colors.cyanAccent,
            title: Text("AlarMe", style: TextStyle(
              fontFamily: 'lobsterTwo',
            fontSize: 40,
            color: Colors.cyanAccent,
            fontWeight: FontWeight.w100,
            fontStyle: FontStyle.normal),
            ),
            centerTitle: true,
            bottom: new TabBar(
                controller: controller,
                tabs: <Tab>[
                  new Tab(text: "Time", icon:  Icon(
                    Icons.access_time,
                    color: Colors.cyanAccent,),),
                  new Tab(text: "Alarm", icon: Icon(
                    Icons.access_alarms,
                    color:Colors.cyanAccent,
                  ),),

                  new Tab(text: "Stopwatch", icon: Icon(
                    Icons.timer,
                    color:Colors.cyanAccent,
                  ),),
                  new Tab(text: "Timer", icon: Icon(
                    Icons.av_timer,
                    color: Colors.cyanAccent,
                  ),),
                ]
            )
        ),
        body: new TabBarView(
            controller: controller,
            children: <Widget>[
              new time.Clock(),
              new alarm.MyApp(),
             new stopwatch.Stopwatch(),
              new timer.MyTimer(),
            ]
        )
    );
  }
}



