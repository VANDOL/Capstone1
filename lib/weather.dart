import 'package:flutter/material.dart';
import 'package:flutter_application_2/landing.dart';
import 'package:timer_builder/timer_builder.dart';
import 'licensesP.dart';
import 'Big_sunny.dart';
import 'Big_night.dart';
import 'Big_snowy.dart';
import 'Big_rainy.dart';
import 'Big_cloudy.dart';
import 'package:intl/intl.dart';
import 'line_chart.dart';
import 'loading.dart';

Widget sunny(BuildContext context) => Container(
    //배경
    decoration: BoxDecoration(
        image: DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage("assets/a/20.png"),
    )),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            SizedBox(height: deH * 0.05),
            //위치 업데이트 아이콘
            Row(children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LicensesP()),
                  );
                },
                icon: Icon(Icons.library_books_outlined),
                color: Color.fromARGB(255, 0, 0, 0),
                iconSize: 30,
                highlightColor: Color.fromRGBO(255, 255, 255, 0.3),
                splashColor: Colors.transparent,
                splashRadius: 25,
              ),
              SizedBox(width: deW * 0.75),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LandingPage()),
                  );
                },
                icon: Icon(Icons.autorenew),
                color: Color.fromARGB(255, 0, 0, 0),
                iconSize: 30,
                highlightColor: Color.fromRGBO(255, 255, 255, 0.3),
                splashColor: Colors.transparent,
                splashRadius: 25,
              ),
            ]),
            Row(children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Big_sunny()),
                  );
                },
                icon: Icon(Icons.add_circle_outline),
                color: Color.fromARGB(255, 0, 0, 0),
                iconSize: 30,
                highlightColor: Color.fromARGB(75, 255, 255, 255),
                splashColor: Colors.transparent,
                splashRadius: 25,
              ),
            ]),
            SizedBox(height: 30),
            Container(
                child: Center(
              child: Image.asset(
                "assets/a/sun.png",
                width: deW * 1.0,
                height: 200,
              ),
            )),
            SizedBox(height: 120),
            Divider(
              color: Color.fromRGBO(0, 0, 0, 1),
              thickness: 2,
              indent: 10,
              endIndent: 10.0,
            ),
            SizedBox(height: 10),
            Container(
                padding: EdgeInsets.all(20),
                width: deW * 0.9,
                height: 190,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  //color: Color.fromRGBO(125, 125, 125, 0.2),
                ),
                child: Column(children: [
                  Text('$ssky   $t1h°',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 40)),
                  SizedBox(height: 5),
                  TimerBuilder.periodic(Duration(seconds: 1),
                      builder: (context) {
                    return Text(
                      '${DateFormat('MM/dd (E) aa hh:mm', 'ko').format(DateTime.now())}',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: "Maple",
                          fontSize: 28),
                    );
                  }),
                  SizedBox(height: 5),
                  Text('최고/최저 기온 : ${tmx0}°/${tmn0}°',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 25)),
                  SizedBox(height: 5),
                  Text('체감 온도 : $cccvvv°',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 20)),
                ])),
            SizedBox(height: 10),
            Divider(
              color: Color.fromRGBO(0, 0, 0, 1),
              thickness: 2,
              indent: 10,
              endIndent: 10.0,
            ),
            SizedBox(height: 10),
            Container(
                padding: EdgeInsets.all(20.0),
                width: deW * 0.9,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                      //top: BorderSide(color: Colors.white, width: 1.5),
                      //bottom: BorderSide(color: Colors.white, width: 1.3)
                      ),
                ),
                child: Column(children: [
                  SizedBox(height: 5),
                  Text('풍속: ${wsd}m/s',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 20)),
                  SizedBox(height: 5),
                  Text('습도: ${reh}%  강수량: ${rn1}mm',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 20)),
                  SizedBox(height: 5),
                  Text('1시간마다 업데이트',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 20)),
                ])),

            SizedBox(height: 10),
            Divider(
              color: Color.fromRGBO(0, 0, 0, 1),
              thickness: 2,
              indent: 10,
              endIndent: 10.0,
            ),
            SizedBox(height: 15),
            Container(
                width: deW * 0.9,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: lineChart_b()),
            SizedBox(height: 10),
            Divider(
              color: Color.fromRGBO(0, 0, 0, 1),
              thickness: 2,
              indent: 10,
              endIndent: 10.0,
            ),
            SizedBox(height: 10),
          ],
        ),
      )),
    ));

Widget night(BuildContext context) => Container(
    //배경
    decoration: BoxDecoration(
        image: DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage("assets/a/abc.png"),
    )),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            SizedBox(height: deH * 0.05),
            //위치 업데이트 아이콘
            Row(children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LicensesP()),
                  );
                },
                icon: Icon(Icons.library_books_outlined),
                color: Colors.white,
                iconSize: 30,
                highlightColor: Color.fromRGBO(255, 255, 255, 0.3),
                splashColor: Colors.transparent,
                splashRadius: 25,
              ),
              SizedBox(width: deW * 0.75),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LandingPage()),
                  );
                },
                icon: Icon(Icons.autorenew),
                color: Colors.white,
                iconSize: 30,
                highlightColor: Color.fromRGBO(255, 255, 255, 0.3),
                splashColor: Colors.transparent,
                splashRadius: 25,
              ),
            ]),
            Row(children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Big_night()),
                  );
                },
                icon: Icon(Icons.add_circle_outline),
                color: Colors.white,
                iconSize: 30,
                highlightColor: Color.fromARGB(75, 255, 255, 255),
                splashColor: Colors.transparent,
                splashRadius: 25,
              ),
            ]),
            SizedBox(height: 30),
            Container(
                child: Center(
              child: Image.asset(
                "assets/a/moon1.png",
                width: deW * 1.0,
                height: 200,
              ),
            )),
            SizedBox(height: 120),
            Divider(
              color: Color.fromRGBO(255, 255, 255, 0.5),
              thickness: 2,
              indent: 10,
              endIndent: 10.0,
            ),
            SizedBox(height: 10),
            Container(
                padding: EdgeInsets.all(20),
                width: deW * 0.9,
                height: 190,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(125, 125, 125, 0.2),
                ),
                child: Column(children: [
                  Text('$ssky   $t1h°',
                      style: TextStyle(color: Colors.white, fontSize: 40)),
                  SizedBox(height: 5),
                  TimerBuilder.periodic(Duration(seconds: 1),
                      builder: (context) {
                    return Text(
                      '${DateFormat('MM/dd (E) aa hh:mm', 'ko').format(DateTime.now())}',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Maple",
                          fontSize: 28),
                    );
                  }),
                  SizedBox(height: 5),
                  Text('최고/최저 기온 : ${tmx0}°/${tmn0}°',
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                  SizedBox(height: 5),
                  Text('체감 온도 : $cccvvv°',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ])),
            SizedBox(height: 10),
            Divider(
              color: Color.fromRGBO(255, 255, 255, 0.5),
              thickness: 2,
              indent: 10,
              endIndent: 10.0,
            ),
            SizedBox(height: 10),
            Container(
                padding: EdgeInsets.all(20.0),
                width: deW * 0.9,
                height: 130,
                decoration:
                    BoxDecoration(color: Color.fromRGBO(125, 125, 125, 0.2)),
                child: Column(children: [
                  SizedBox(height: 5),
                  Text('풍속: ${wsd}m/s',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  SizedBox(height: 5),
                  Text('습도: ${reh}%  강수량: ${rn1}mm',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  SizedBox(height: 5),
                  Text('1시간마다 업데이트',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ])),
            SizedBox(height: 10),
            Divider(
              color: Color.fromRGBO(255, 255, 255, 0.5),
              thickness: 2,
              indent: 10,
              endIndent: 10.0,
            ),
            SizedBox(height: 15),
            Container(
                width: deW * 0.9,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: lineChart()),

            SizedBox(height: 10),
            Divider(
              color: Color.fromRGBO(255, 255, 255, 0.5),
              thickness: 2,
              indent: 10,
              endIndent: 10.0,
            ),
            SizedBox(height: 10),
          ],
        ),
      )),
    ));

Widget rainy(BuildContext context) => Container(
    //배경
    decoration: BoxDecoration(
        image: DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage("assets/a/rainy.png"),
    )),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            SizedBox(height: deH * 0.05),
            Row(children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LicensesP()),
                  );
                },
                icon: Icon(Icons.library_books_outlined),
                color: Color.fromARGB(255, 0, 0, 0),
                iconSize: 30,
                highlightColor: Color.fromRGBO(255, 255, 255, 0.3),
                splashColor: Colors.transparent,
                splashRadius: 25,
              ),
              SizedBox(width: deW * 0.75),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LandingPage()),
                  );
                },
                icon: Icon(Icons.autorenew),
                color: Color.fromARGB(255, 0, 0, 0),
                iconSize: 30,
                highlightColor: Color.fromRGBO(255, 255, 255, 0.3),
                splashColor: Colors.transparent,
                splashRadius: 25,
              ),
            ]),
            Row(children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Big_rainy()),
                  );
                },
                icon: Icon(Icons.add_circle_outline),
                color: Color.fromARGB(255, 0, 0, 0),
                iconSize: 30,
                highlightColor: Color.fromARGB(75, 255, 255, 255),
                splashColor: Colors.transparent,
                splashRadius: 25,
              ),
            ]),
            SizedBox(height: 30),
            Container(
                child: Center(
              child: Image.asset(
                "assets/a/umbrella.png",
                width: deW * 1.0,
                height: 200,
              ),
            )),
            SizedBox(height: 120),
            Divider(
              color: Color.fromRGBO(0, 0, 0, 1),
              thickness: 2,
              indent: 10,
              endIndent: 10.0,
            ),
            SizedBox(height: 10),
            Container(
                padding: EdgeInsets.all(20),
                width: deW * 0.9,
                height: 190,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  //color: Color.fromRGBO(125, 125, 125, 0.2),
                ),
                child: Column(children: [
                  Text('$ssky   $t1h°',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 40)),
                  SizedBox(height: 5),
                  TimerBuilder.periodic(Duration(seconds: 1),
                      builder: (context) {
                    return Text(
                      '${DateFormat('MM/dd (E) aa hh:mm', 'ko').format(DateTime.now())}',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: "Maple",
                          fontSize: 28),
                    );
                  }),
                  SizedBox(height: 5),
                  Text('최고/최저 기온 : ${tmx0}°/${tmn0}°',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 25)),
                  SizedBox(height: 5),
                  Text('체감 온도 : $cccvvv°',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 20)),
                ])),
            SizedBox(height: 10),
            Divider(
              color: Color.fromRGBO(0, 0, 0, 1),
              thickness: 2,
              indent: 10,
              endIndent: 10.0,
            ),
            SizedBox(height: 10),
            Container(
                padding: EdgeInsets.all(20.0),
                width: deW * 0.9,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(children: [
                  SizedBox(height: 5),
                  Text('풍속: ${wsd}m/s',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 20)),
                  SizedBox(height: 5),
                  Text('습도: ${reh}%  강수량: ${rn1}mm',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 20)),
                  SizedBox(height: 5),
                  Text('1시간마다 업데이트',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 20)),
                ])),
            SizedBox(height: 10),
            Divider(
              color: Color.fromRGBO(0, 0, 0, 1),
              thickness: 2,
              indent: 10,
              endIndent: 10.0,
            ),
            SizedBox(height: 15),
            Container(
                width: deW * 0.9,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: lineChart_b()),
            SizedBox(height: 10),
            Divider(
              color: Color.fromRGBO(0, 0, 0, 1),
              thickness: 2,
              indent: 10,
              endIndent: 10.0,
            ),
            SizedBox(height: 10),
          ],
        ),
      )),
    ));

Widget cloudy(BuildContext context) => Container(
    //배경
    decoration: BoxDecoration(
        image: DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage("assets/a/rainy.png"),
    )),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            SizedBox(height: deH * 0.05),
            Row(children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LicensesP()),
                  );
                },
                icon: Icon(Icons.library_books_outlined),
                color: Color.fromARGB(255, 0, 0, 0),
                iconSize: 30,
                highlightColor: Color.fromRGBO(255, 255, 255, 0.3),
                splashColor: Colors.transparent,
                splashRadius: 25,
              ),
              SizedBox(width: deW * 0.75),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LandingPage()),
                  );
                },
                icon: Icon(Icons.autorenew),
                color: Color.fromARGB(255, 0, 0, 0),
                iconSize: 30,
                highlightColor: Color.fromRGBO(255, 255, 255, 0.3),
                splashColor: Colors.transparent,
                splashRadius: 25,
              ),
            ]),
            Row(children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Big_cloudy()),
                  );
                },
                icon: Icon(Icons.add_circle_outline),
                color: Color.fromARGB(255, 0, 0, 0),
                iconSize: 30,
                highlightColor: Color.fromARGB(75, 255, 255, 255),
                splashColor: Colors.transparent,
                splashRadius: 25,
              ),
            ]),
            SizedBox(height: 30),
            Container(
                child: Center(
              child: Image.asset(
                "assets/a/cloud.png",
                width: deW * 1.0,
                height: 200,
              ),
            )),
            SizedBox(height: 120),
            Divider(
              color: Color.fromRGBO(0, 0, 0, 1),
              thickness: 2,
              indent: 10,
              endIndent: 10.0,
            ),
            SizedBox(height: 10),
            Container(
                padding: EdgeInsets.all(20),
                width: deW * 0.9,
                height: 190,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  //color: Color.fromRGBO(125, 125, 125, 0.2),
                ),
                child: Column(children: [
                  Text('$ssky   $t1h°',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 40)),
                  SizedBox(height: 5),
                  TimerBuilder.periodic(Duration(seconds: 1),
                      builder: (context) {
                    return Text(
                      '${DateFormat('MM/dd (E) aa hh:mm', 'ko').format(DateTime.now())}',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: "Maple",
                          fontSize: 28),
                    );
                  }),
                  SizedBox(height: 5),
                  Text('최고/최저 기온 : ${tmx0}°/${tmn0}°',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 25)),
                  SizedBox(height: 5),
                  Text('체감 온도 : $cccvvv°',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 20)),
                ])),
            SizedBox(height: 10),
            Divider(
              color: Color.fromRGBO(0, 0, 0, 1),
              thickness: 2,
              indent: 10,
              endIndent: 10.0,
            ),
            SizedBox(height: 10),
            Container(
                padding: EdgeInsets.all(20.0),
                width: deW * 0.9,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(children: [
                  SizedBox(height: 5),
                  Text('풍속: ${wsd}m/s',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 20)),
                  SizedBox(height: 5),
                  Text('습도: ${reh}%  강수량: ${rn1}mm',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 20)),
                  SizedBox(height: 5),
                  Text('1시간마다 업데이트',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 20)),
                ])),
            SizedBox(height: 10),
            Divider(
              color: Color.fromRGBO(0, 0, 0, 1),
              thickness: 2,
              indent: 10,
              endIndent: 10.0,
            ),
            SizedBox(height: 15),
            Container(
                width: deW * 0.9,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: lineChart_b()),
            SizedBox(height: 10),
            Divider(
              color: Color.fromRGBO(0, 0, 0, 1),
              thickness: 2,
              indent: 10,
              endIndent: 10.0,
            ),
            SizedBox(height: 10),
          ],
        ),
      )),
    ));

Widget snowy(BuildContext context) => Container(
    //배경
    decoration: BoxDecoration(
        image: DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage("assets/a/snowy.png"),
    )),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            SizedBox(height: deH * 0.05),
            Row(children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LicensesP()),
                  );
                },
                icon: Icon(Icons.library_books_outlined),
                color: Color.fromARGB(255, 0, 0, 0),
                iconSize: 30,
                highlightColor: Color.fromRGBO(255, 255, 255, 0.3),
                splashColor: Colors.transparent,
                splashRadius: 25,
              ),
              SizedBox(width: deW * 0.75),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LandingPage()),
                  );
                },
                icon: Icon(Icons.autorenew),
                color: Color.fromARGB(255, 0, 0, 0),
                iconSize: 30,
                highlightColor: Color.fromRGBO(255, 255, 255, 0.3),
                splashColor: Colors.transparent,
                splashRadius: 25,
              ),
            ]),
            Row(children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Big_snowy()),
                  );
                },
                icon: Icon(Icons.add_circle_outline),
                color: Color.fromARGB(255, 0, 0, 0),
                iconSize: 30,
                highlightColor: Color.fromARGB(75, 255, 255, 255),
                splashColor: Colors.transparent,
                splashRadius: 25,
              ),
            ]),
            SizedBox(height: 30),
            Container(
                child: Center(
              child: Image.asset(
                "assets/a/snowflake.png",
                width: deW * 1.0,
                height: 200,
              ),
            )),
            SizedBox(height: 120),
            Divider(
              color: Color.fromRGBO(0, 0, 0, 1),
              thickness: 2,
              indent: 10,
              endIndent: 10.0,
            ),
            SizedBox(height: 10),
            Container(
                padding: EdgeInsets.all(20),
                width: deW * 0.9,
                height: 190,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  //color: Color.fromRGBO(125, 125, 125, 0.2),
                ),
                child: Column(children: [
                  Text('$ssky   $t1h°',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 40)),
                  SizedBox(height: 5),
                  TimerBuilder.periodic(Duration(seconds: 1),
                      builder: (context) {
                    return Text(
                      '${DateFormat('MM/dd (E) aa hh:mm', 'ko').format(DateTime.now())}',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: "Maple",
                          fontSize: 28),
                    );
                  }),
                  SizedBox(height: 5),
                  Text('최고/최저 기온 : ${tmx0}°/${tmn0}°',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 25)),
                  SizedBox(height: 5),
                  Text('체감 온도 : $cccvvv°',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 20)),
                ])),
            SizedBox(height: 10),
            Divider(
              color: Color.fromRGBO(0, 0, 0, 1),
              thickness: 2,
              indent: 10,
              endIndent: 10.0,
            ),
            SizedBox(height: 10),
            Container(
                padding: EdgeInsets.all(20.0),
                width: deW * 0.9,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(children: [
                  SizedBox(height: 5),
                  Text('풍속: ${wsd}m/s',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 20)),
                  SizedBox(height: 5),
                  Text('습도: ${reh}%  강수량: ${rn1}mm',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 20)),
                  SizedBox(height: 5),
                  Text('1시간마다 업데이트',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 20)),
                ])),
            SizedBox(height: 10),
            Divider(
              color: Color.fromRGBO(0, 0, 0, 1),
              thickness: 2,
              indent: 10,
              endIndent: 10.0,
            ),
            SizedBox(height: 15),
            Container(
                width: deW * 0.9,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: lineChart_b()),
            SizedBox(height: 10),
            Divider(
              color: Color.fromRGBO(0, 0, 0, 1),
              thickness: 2,
              indent: 10,
              endIndent: 10.0,
            ),
            SizedBox(height: 10),
          ],
        ),
      )),
    ));
