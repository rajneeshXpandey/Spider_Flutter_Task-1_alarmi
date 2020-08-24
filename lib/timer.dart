import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:async';

class MyTimer extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<MyTimer> {
  static const duration = const Duration(seconds: 1);

  int secondsPassed = 0;
  bool isActive = false;

  Timer timer;

  void handleTick() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });
    }
    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;
    int hours = secondsPassed ~/ (60 * 60);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color(0xff2D2F41),

          body: Center(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    LabelText(
                        label: 'HRS',
                        value: hours.toString().padLeft(2, '0')),
                    LabelText(
                        label: 'MIN',
                        value: minutes.toString().padLeft(2, '0')),
                    LabelText(
                        label: 'SEC',
                        value: seconds.toString().padLeft(2, '0')),
                  ],
                ),
               SizedBox(height: 100),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
          color: Colors.cyan,
           shape: BoxShape.rectangle,
           borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
             bottomLeft: Radius.circular(30.0),
               bottomRight: Radius.circular(30.0)
           )),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RaisedButton(
                          padding: EdgeInsets.all(10),
                          color: Colors.greenAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Text('Play',
                            style: TextStyle(fontSize: 25,color: Colors.purple),
                          ),
                          onPressed: () {
                            setState(() {
                              if(!isActive)
                              isActive = !isActive;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RaisedButton(
                          padding: EdgeInsets.all(10),
                          color:Colors.amberAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Text('Pause' ,
                            style: TextStyle(fontSize: 25,color:Colors.purple
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              if(isActive)
                              isActive = !isActive;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RaisedButton(
                          padding: EdgeInsets.all(10),
                          color: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Text('Reset',
                              style: TextStyle(fontSize: 25,color: Colors.white),
                        ),
                          onPressed: () {
                            setState(() {
                              secondsPassed=0;
                              if(isActive)
                             isActive = !isActive;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class LabelText extends StatelessWidget {
  LabelText({this.label, this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(

     margin: EdgeInsets.symmetric(horizontal: 5),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
           '$value'+':',
            style: TextStyle(
              fontFamily: 'specialElite',
                fontSize: 60.0,
                color: Colors.cyanAccent,
                fontWeight: FontWeight.w400),

          ),

          Text(
            '$label',
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.cyanAccent,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
