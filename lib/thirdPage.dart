import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'cloth.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import 'loading.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  void initState() {
    super.initState();
  }

  Widget season() {
    var Month = DateFormat('MM').format(DateTime.now());
    int month = int.parse(Month);

    if (month == 6 || month == 7 || month == 8 || month == 9) {
      return summer();
    }
    if (month == 3 || month == 4 || month == 5) {
      return spring();
    }
    if (month == 10) {
      return autumn();
    } else {
      return winter();
    }
  }

  Widget temp_clothes() {
    //int tetemp = int.parse(t1h);
    double tetemp = double.parse(t1h);
    if (tetemp == 4 || tetemp == 5 || tetemp == 6 || tetemp == 7) {
      return Tmp4();
    }
    if (tetemp == 8 || tetemp == 9 || tetemp == 10) {
      return Tmp8();
    }
    if (tetemp == 11 ||
        tetemp == 12 ||
        tetemp == 13 ||
        tetemp == 14 ||
        tetemp == 15) {
      return Tmp11();
    }
    if (tetemp == 16 || tetemp == 17 || tetemp == 18) {
      return Tmp16();
    }
    if (tetemp == 19 ||
        tetemp == 20 ||
        tetemp == 21 ||
        tetemp == 22 ||
        tetemp == 23) {
      return Tmp19();
    }
    if (tetemp > 23) {
      return Tmp23();
    } else {
      return Tmp0();
    }
  }

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
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/a/cloth_back.png"),
            )),
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  child: Center(
                      child: Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                    child: Column(children: [
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          TimerBuilder.periodic(Duration(seconds: 1),
                              builder: (context) {
                            return Text(
                              '${DateFormat('MM월 dd일').format(DateTime.now())}',
                              style: TextStyle(fontSize: 23),
                            );
                          }),
                          Text(
                            "/$seasons  현재 기온 : $t1h°",
                            style: TextStyle(fontSize: 23),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Divider(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                        thickness: 2,
                        endIndent: 10.0,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "기온별",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      temp_clothes(),
                      Divider(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                        thickness: 2,
                        endIndent: 10.0,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Text(
                            "계절별",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      season()
                    ]),
                  )),
                ))));
  }
}
