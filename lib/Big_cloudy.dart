import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';
import 'landing.dart';
import 'licensesP.dart';
import 'loading.dart';

class Big_cloudy extends StatefulWidget {
  @override
  _Big_cloudyState createState() => _Big_cloudyState();
}

class _Big_cloudyState extends State<Big_cloudy> {
  var MaD = DateFormat('MM/dd (E)', 'ko').format(DateTime.now());
  var Hm = DateFormat('aa hh:mm', 'ko').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    Future<void> _onBackPressed(BuildContext context) async {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('종료하시겠습니까?'),
          actions: <Widget>[
            TextButton(
              child: const Text('종료'),
              onPressed: () => SystemNavigator.pop(),
            ),
            TextButton(
              child: const Text('돌아가기'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }

    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
        onWillPop: () async {
          await _onBackPressed(context);
          return false;
        },
        child: Container(
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
                //padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                child: Column(
                  children: [
                    SizedBox(height: deviceHeight * 0.05),
                    Row(children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LicensesP()),
                          );
                        },
                        icon: Icon(Icons.library_books_outlined),
                        color: Color.fromARGB(255, 0, 0, 0),
                        iconSize: 30,
                        highlightColor: Color.fromRGBO(255, 255, 255, 0.3),
                        splashColor: Colors.transparent,
                        splashRadius: 25,
                      ),
                      SizedBox(width: deviceWidth * 0.75),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LandingPage()),
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
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.remove_circle_outline),
                        iconSize: 30,
                        highlightColor: Color.fromRGBO(255, 255, 255, 0.3),
                        splashColor: Colors.transparent,
                        splashRadius: 25,
                      ),
                    ]),
                    SizedBox(height: 30),
                    Container(
                        child: Center(
                      child: Image.asset(
                        "assets/a/cloud.png",
                        width: deviceWidth * 1.0,
                        height: 200,
                      ),
                    )),
                    SizedBox(height: 30),
                    Divider(
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                      thickness: 2,
                      indent: 10,
                      endIndent: 10.0,
                    ),
                    SizedBox(height: 20),
                    Container(
                        padding: EdgeInsets.all(20),
                        width: deviceWidth * 0.9,
                        height: 900,
                        decoration: BoxDecoration(
                          //color: Colors.transparent,
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                        ),
                        child: Center(
                            child: Column(children: [
                          Text('$ssky $t1h°', style: TextStyle(fontSize: 60)),
                          SizedBox(height: 25),
                          TimerBuilder.periodic(Duration(seconds: 1),
                              builder: (context) {
                            return Text(
                              '${DateFormat('MM/dd (E)', 'ko').format(DateTime.now())}',
                              style: TextStyle(fontSize: 50),
                            );
                          }),
                          SizedBox(height: 25),
                          TimerBuilder.periodic(Duration(seconds: 1),
                              builder: (context) {
                            return Text(
                              '${DateFormat('aa hh:mm', 'ko').format(DateTime.now())}',
                              style: TextStyle(fontSize: 50),
                            );
                          }),
                          SizedBox(height: 25),
                          Text('최고/최저 기온', style: TextStyle(fontSize: 50)),
                          SizedBox(height: 25),
                          Text('$tmx0° / $tmn0°',
                              style: TextStyle(fontSize: 50)),
                          SizedBox(height: 25),
                          Text('체감 온도', style: TextStyle(fontSize: 50)),
                          SizedBox(height: 25),
                          Text('$cccvvv°', style: TextStyle(fontSize: 50)),
                          SizedBox(height: 25),
                          Text('풍속: ${wsd}m/s', style: TextStyle(fontSize: 50)),
                          SizedBox(height: 25),
                          Text('습도: ${reh}%', style: TextStyle(fontSize: 50)),
                          SizedBox(height: 25),
                          Text('강수량: ${rn1}mm', style: TextStyle(fontSize: 50)),
                          SizedBox(height: 25),
                          Text('1시간마다 업데이트', style: TextStyle(fontSize: 30)),
                        ]))),
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
            )));
  }
}
