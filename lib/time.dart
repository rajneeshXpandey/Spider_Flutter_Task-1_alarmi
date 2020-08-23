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
            child: Expanded(
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
      ),
      );
}



//
//class TimeScreen extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return TimeScreenState();
//  }
//}
//
//class TimeScreenState extends State<TimeScreen> {
//
//  double seconds;
//
//  _currentTime() {
//    return "${DateTime.now().hour} : ${DateTime.now().minute}";
//  }
//
//  _triggerUpdate() {
//    Timer.periodic(
//        Duration(seconds: 1),
//            (Timer timer) => setState(
//              () {
//            seconds = DateTime.now().second / 60;
//          },
//        ));
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    seconds = DateTime.now().second / 60;
//    _triggerUpdate();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Container(
//        color: Color(0xffF4ECFF),
//        width: MediaQuery.of(context).size.width,
//        height: MediaQuery.of(context).size.height,
//        child: Center(
//          child: Stack(
//            children: <Widget>[
//              Center(
//                child: Container(
//                  width: double.infinity,
//                  height: double.infinity,
//                  decoration: BoxDecoration(
//                    shape: BoxShape.rectangle,
//                    color:Color(0xffF4ECFF),
//                  ),
//                ),
//              ),
//              Center(
//                child: Container(
//                    margin: const EdgeInsets.all(36.0),
//                    width: 340,
//                    height: 340,
//                    child: Center(
//                      child: Text(
//                        _currentTime(),
//                        style: GoogleFonts.orbitron(
//                            fontSize: 60.0,
//                            textStyle: TextStyle(color: Color(0xff705891)),
//                            fontWeight: FontWeight.normal),
//                      ),
//                    )),
//              ),
//              Center(
//                child: CircularPercentIndicator(
//                  radius: 250.0,
//                  lineWidth: 6.0,
//                  animation: true,
//                  percent: seconds,
//                  circularStrokeCap: CircularStrokeCap.round,
//                  backgroundColor: hexToColor('#2c3143'),
//                  progressColor: hexToColor('#58CBF4'),
//                ),
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//Color hexToColor(String code) {
//  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
//}