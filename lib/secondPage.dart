import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'loading.dart';
import 'weather.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

var Month = DateFormat('MM').format(DateTime.now());
int month = int.parse(Month);

class _SecondPageState extends State<SecondPage> {
  void initState() {
    super.initState();
    season1();
    //print(month);
  }

  var now = DateTime.now();
  var MaD = DateFormat('MM/dd (E) aa hh:mm', 'ko').format(DateTime.now());

  Widget pageSet() {
    print('두번째페이지');
    var hh = DateFormat('HH').format(now);
    int hhh = int.parse(hh);
    if (hhh > 5 && hhh < 18) {
      if (ssky == '비') {
        return rainy(context);
      }
      if (ssky == '눈') {
        return snowy(context);
      }
      if (ssky == '흐림') {
        return cloudy(context);
      } else {
        return sunny(context);
      }
    } else {
      if (ssky == '비') {
        return rainy(context);
      }
      if (ssky == '눈') {
        return snowy(context);
      }
      if (ssky == '흐림') {
        return cloudy(context);
      } else {
        return night(context);
      }
    }
  }

  void season1() {
    if (month == 11 || month == 12 || month == 1 || month == 2) {
      seasons = '겨울';
      return;
    }
    if (month == 3 || month == 4 || month == 5) {
      seasons = '봄';
      return;
    }
    if (month == 10) {
      seasons = '가을';
      return;
    } else {
      seasons = '여름';
      return;
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
        child: pageSet());
  }
}
