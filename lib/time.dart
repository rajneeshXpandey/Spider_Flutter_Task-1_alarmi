import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:analog_clock/analog_clock.dart';



class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        
          backgroundColor: Color(0xff2D2F41),
          title: Text(
            "Welcome to AlarMe!",
            style: GoogleFonts.lobsterTwo(
                fontSize: 30,
                color: Colors.cyanAccent,
                fontWeight: FontWeight.w200,
                fontStyle: FontStyle.normal),
          ),
        ),
        backgroundColor:Color(0xff2D2F41) ,
        body: Center(

          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            ),
            elevation: 100,
              color:Colors.cyanAccent ,
            shadowColor: Colors.cyanAccent,
            child: AnalogClock(

              decoration: BoxDecoration(

                  border: Border.all(width: 2.0, color:Color(0xffF4ECFF)),
                  gradient: LinearGradient(
                colors: [Color(0xFF6448FE),Color(0xFF61A3FE)],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,

              ),
                  shape: BoxShape.circle),
              width: 350.0,
              isLive: true,
              hourHandColor: Colors.white,
              minuteHandColor: Colors.white,
              showSecondHand: true,
              numberColor: Colors.white,
              showNumbers: false,
              textScaleFactor: 1.4,
              showTicks: true,
              tickColor: Colors.white,
              secondHandColor: Colors.white,
              showDigitalClock: false,
             // datetime: DateTime(2020, 1, 1, 9, 12, 15),
            ),
          ),
        ),
      ),
      );
}

