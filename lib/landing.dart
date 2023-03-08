import 'package:flutter/material.dart';
import 'package:flutter_application_2/navi.dart';
import 'package:get/get.dart' as Get;
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:xml2json/xml2json.dart';
import 'package:flutter_application_2/song.dart';
import 'dart:math';
import 'loading.dart';

var deW;
var deH;

List aaa = ["", "", ""];
List bbb = ["", "", ""];
List ccc = ["", "", ""];

var mm = DateFormat('MM').format(now);
int mmm = int.parse(mm);
//int mmm = 3;
void getMusic() async {
  print('노래시작');
  int random = Random().nextInt(au1.length ~/ 2 - 2);
  //int random = 0;
  int count = 0;
  int i = 0;
  int randC = 3;
  String temp = '';
  String art = '';
  while (randC != 0) {
    randC--;

    if ((mmm == 11 || mmm == 12 || mmm == 1 || mmm == 2) && ssky == '맑음') {
      int random = Random().nextInt(wi1.length ~/ 2 - 1);
      temp =
          'https://www.maniadb.com/api/search/${wi1[2 * random]}/?sr=song&display=100&key=jjhe1026@naver.com&v=0.5';
      art = "${wi1[2 * random + 1]}";
    }
    if ((mmm == 11 || mmm == 12 || mmm == 1 || mmm == 2) && ssky == '눈') {
      int random = Random().nextInt(wi3.length ~/ 2 - 1);
      temp =
          'https://www.maniadb.com/api/search/${wi3[2 * random]}/?sr=song&display=100&key=jjhe1026@naver.com&v=0.5';
      art = "${wi3[2 * random + 1]}";
    }
    if ((mmm == 11 || mmm == 12 || mmm == 1 || mmm == 2) &&
        (ssky == '비' || ssky == '흐림')) {
      int random = Random().nextInt(wi2.length ~/ 2 - 1);
      temp =
          'https://www.maniadb.com/api/search/${wi2[2 * random]}/?sr=song&display=100&key=jjhe1026@naver.com&v=0.5';
      art = "${wi2[2 * random + 1]}";
    }
    if ((mmm == 3 || mmm == 4 || mmm == 5) && ssky == '맑음') {
      int random = Random().nextInt(sp1.length ~/ 2 - 1);
      temp =
          'https://www.maniadb.com/api/search/${sp1[2 * random]}/?sr=song&display=100&key=jjhe1026@naver.com&v=0.5';
      art = "${sp1[2 * random + 1]}";
    }
    if ((mmm == 3 || mmm == 4 || mmm == 5) && ssky == '비') {
      int random = Random().nextInt(sp3.length ~/ 2 - 1);
      temp =
          'https://www.maniadb.com/api/search/${sp3[2 * random]}/?sr=song&display=100&key=jjhe1026@naver.com&v=0.5';
      art = "${sp3[2 * random + 1]}";
    }
    if ((mmm == 3 || mmm == 4 || mmm == 5) && ssky == '흐림') {
      int random = Random().nextInt(sp2.length ~/ 2 - 1);
      temp =
          'https://www.maniadb.com/api/search/${sp2[2 * random]}/?sr=song&display=100&key=jjhe1026@naver.com&v=0.5';
      art = "${sp2[2 * random + 1]}";
    }
    if (mmm == 10 && ssky == '맑음') {
      int random = Random().nextInt(au1.length ~/ 2 - 1);
      temp =
          'https://www.maniadb.com/api/search/${au1[2 * random]}/?sr=song&display=100&key=jjhe1026@naver.com&v=0.5';
      art = "${au1[2 * random + 1]}";
    }
    if (mmm == 10 && ssky == '비') {
      int random = Random().nextInt(au3.length ~/ 2 - 1);
      temp =
          'https://www.maniadb.com/api/search/${au3[2 * random]}/?sr=song&display=100&key=jjhe1026@naver.com&v=0.5';
      art = "${au3[2 * random + 1]}";
    }
    if (mmm == 10 && ssky == '흐림') {
      int random = Random().nextInt(au2.length ~/ 2 - 1);
      temp =
          'https://www.maniadb.com/api/search/${au2[2 * random]}/?sr=song&display=100&key=jjhe1026@naver.com&v=0.5';
      art = "${au2[2 * random + 1]}";
    }
    if ((mmm == 6 && mmm == 7 && mmm == 8 && mmm == 9) && ssky == '맑음') {
      int random = Random().nextInt(su1.length ~/ 2 - 1);
      temp =
          'https://www.maniadb.com/api/search/${su1[2 * random]}/?sr=song&display=100&key=jjhe1026@naver.com&v=0.5';
      art = "${su1[2 * random + 1]}";
    }
    if ((mmm == 6 && mmm == 7 && mmm == 8 && mmm == 9) && ssky == '비') {
      int random = Random().nextInt(su3.length ~/ 2 - 1);
      temp =
          'https://www.maniadb.com/api/search/${su3[2 * random]}/?sr=song&display=100&key=jjhe1026@naver.com&v=0.5';
      art = "${su3[2 * random + 1]}";
    }
    if ((mmm == 6 && mmm == 7 && mmm == 8 && mmm == 9) && ssky == '흐림') {
      int random = Random().nextInt(su2.length ~/ 2 - 1);
      temp =
          'https://www.maniadb.com/api/search/${su2[2 * random]}/?sr=song&display=100&key=jjhe1026@naver.com&v=0.5';
      art = "${su2[2 * random + 1]}";
    }

    Response response = await get(Uri.parse(temp));

    final getXmlData = response.body; //xml 데이터를 받아온다.
    final Xml2JsonData = Xml2Json()..parse(getXmlData); //json으로 변환
    final jsonData = Xml2JsonData.toParker(); //그냥 령식 옵션
    var parsingData = jsonDecode(jsonData);

    var totalCount = parsingData['rss']['channel']['total'];
    if (totalCount == '1') {
      aaa[count] =
          parsingData['rss']['channel']['item']['maniadb:album']['image'];
      bbb[count] = parsingData['rss']['channel']['item']['title'];
      ccc[count] =
          parsingData['rss']['channel']['item']['maniadb:artist']['name'];
      count++;
    } else {
      for (int j = 0; j < 100; j++) {
        if (art ==
            parsingData['rss']['channel']['item'][j]['maniadb:artist']
                ['name']) {
          aaa[count] = parsingData['rss']['channel']['item'][j]['maniadb:album']
              ['image'];
          bbb[count] = parsingData['rss']['channel']['item'][j]['title'];
          ccc[count] = parsingData['rss']['channel']['item'][j]
              ['maniadb:artist']['name'];
          count++;
          i++;
          break;
        }
      }
    }
  }
  print('노래끝');
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    getLocation();
    getDayTime();
    api_convert();
    shortWeatherDate();
    superShortWeatherDate();
    Timer(Duration(seconds: 7), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NaviPage()));
      //Get.Get.to(NaviPage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    deW = deviceWidth;
    deH = deviceHeight;
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
          color: Color.fromARGB(255, 97, 170, 230),
          child: Center(
              child: Lottie.asset(
            'assets/json/loading.json',
            width: 400,
            height: 400,
            fit: BoxFit.fill,
          )),
        ),
      ],
    ));
  }
}
