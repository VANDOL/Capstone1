import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';
import 'landing.dart';
import 'loading.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
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

  //late TabController controller;

  @override
  Widget build(BuildContext context) {
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
              image: AssetImage("assets/a/song_back.png"),
            )),
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                    child: Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                        child: Center(
                            child: Column(
                          children: [
                            SizedBox(height: 40),
                            Row(
                              children: [
                                TimerBuilder.periodic(Duration(seconds: 1),
                                    builder: (context) {
                                  return Text(
                                    '${DateFormat('MM월 dd일').format(DateTime.now())}',
                                    style: TextStyle(fontSize: 25),
                                  );
                                }),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "-  $seasons    $ssky",
                                  style: TextStyle(fontSize: 25),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              thickness: 2,
                              endIndent: 10.0,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Image.network(
                                    aaa[0],
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.transparent,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          '사진 로딩 중',
                                          style: TextStyle(fontSize: 30),
                                        ),
                                      );
                                    },
                                    width: 150,
                                    height: 150,
                                  ),
                                  SizedBox(height: 10),
                                  Text('${bbb[0]}',
                                      style: TextStyle(fontSize: 27)),
                                  SizedBox(height: 10),
                                  Text(
                                    '${ccc[0]}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Divider(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              thickness: 2,
                              endIndent: 10.0,
                            ),
                            SizedBox(height: 20),
                            Container(
                              child: Column(
                                children: [
                                  Image.network(
                                    aaa[1],
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: 150,
                                        height: 150,
                                        color: Colors.transparent,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          '사진 로딩 중',
                                          style: TextStyle(fontSize: 30),
                                        ),
                                      );
                                    },
                                    width: 150,
                                    height: 150,
                                  ),
                                  SizedBox(height: 10),
                                  Text('${bbb[1]}',
                                      style: TextStyle(fontSize: 27)),
                                  SizedBox(height: 10),
                                  Text(
                                    '${ccc[1]}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Divider(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              thickness: 2,
                              endIndent: 10.0,
                            ),
                            SizedBox(height: 20),
                            Container(
                              child: Column(
                                children: [
                                  Image.network(
                                    aaa[2],
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.transparent,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          '사진 로딩 중',
                                          style: TextStyle(fontSize: 30),
                                        ),
                                      );
                                    },
                                    width: 150,
                                    height: 150,
                                  ),
                                  SizedBox(height: 10),
                                  Text('${bbb[2]}',
                                      style: TextStyle(fontSize: 27)),
                                  SizedBox(height: 10),
                                  Text(
                                    '${ccc[2]}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(height: 30),
                                ],
                              ),
                            ),
                          ],
                        )))))));
  }
}
