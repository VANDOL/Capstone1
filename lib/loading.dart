import 'dart:convert';
import 'dart:math';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:math' as Math;
import 'landing.dart';

class ConvGridGps {
  static const double RE = 6371.00877; // 지구 반경(km)
  static const double GRID = 5.0; // 격자 간격(km)
  static const double SLAT1 = 30.0; // 투영 위도1(degree)
  static const double SLAT2 = 60.0; // 투영 위도2(degree)
  static const double OLON = 126.0; // 기준점 경도(degree)
  static const double OLAT = 38.0; // 기준점 위도(degree)
  static const double XO = 43; // 기준점 X좌표(GRID)
  static const double YO = 136; // 기1준점 Y좌표(GRID)
  static const double DEGRAD = Math.pi / 180.0;
  static const double RADDEG = 180.0 / Math.pi;
  static double get re => RE / GRID;
  static double get slat1 => SLAT1 * DEGRAD;
  static double get slat2 => SLAT2 * DEGRAD;
  static double get olon => OLON * DEGRAD;
  static double get olat => OLAT * DEGRAD;

  static double get snTmp =>
      Math.tan(Math.pi * 0.25 + slat2 * 0.5) /
      Math.tan(Math.pi * 0.25 + slat1 * 0.5);

  static double get sn =>
      Math.log(Math.cos(slat1) / Math.cos(slat2)) / Math.log(snTmp);

  static double get sfTmp => Math.tan(Math.pi * 0.25 + slat1 * 0.5);

  static double get sf => Math.pow(sfTmp, sn) * Math.cos(slat1) / sn;

  static double get roTmp => Math.tan(Math.pi * 0.25 + olat * 0.5);

  static double get ro => re * sf / Math.pow(roTmp, sn);

  static gpsToGRID(double v1, double v2) {
    var xy = [0, 0];
    double theta;

    var ra = Math.tan(Math.pi * 0.25 + (v1) * DEGRAD * 0.5);
    ra = re * sf / Math.pow(ra, sn);
    theta = v2 * DEGRAD - olon;
    if (theta > Math.pi) theta -= 2.0 * Math.pi;
    if (theta < -Math.pi) theta += 2.0 * Math.pi;
    theta *= sn;
    xy[0] = (ra * Math.sin(theta) + XO + 0.5).floor();
    xy[1] = (ro - ra * Math.cos(theta) + YO + 0.5).floor();

    return xy;
  }

  static gridToGPS(int v1, int v2) {
    var rs = {};
    double theta;

    rs['x'] = v1;
    rs['y'] = v2;
    int xn = (v1 - XO).toInt();
    int yn = (ro - v2 + YO).toInt();
    var ra = Math.sqrt(xn * xn + yn * yn);
    if (sn < 0.0) ra = -ra;
    var alat = Math.pow((re * sf / ra), (1.0 / sn));
    alat = 2.0 * Math.atan(alat) - Math.pi * 0.5;

    if (xn.abs() <= 0.0) {
      theta = 0.0;
    } else {
      if (yn.abs() <= 0.0) {
        theta = Math.pi * 0.5;
        if (xn < 0.0) theta = -theta;
      } else
        theta = Math.atan2(xn, yn);
    }
    var alon = theta / sn + olon;
    rs['lat'] = alat * RADDEG;
    rs['lng'] = alon * RADDEG;

    return rs;
  }
}

int x = 97;
int y = 75;
String today = '', time = '';
String tomorrow = '', yesterday = '', ttomorrow = '';
String baseDate = '', baseTime = ''; //단기예보 시간 날짜
String stime = '', sday = ''; //초단기예보 시간
var t1h = '';
var wsd = '';
var reh = '';
var rn1 = '';
var pty = '';
var tmn0 = '', tmx0 = '', pop0 = '', sky0 = '';
var tmn1 = '', tmx1 = '', pop1 = '', sky1 = '';
var sky2 = '', tmn2 = '', tmx2 = '', pop2 = '';
var t_1 = '', t_2 = '', t_3 = '', t_4 = '', t_5 = '', t_6 = '';
var b_1 = '', b_2 = '', b_3 = '', b_4 = '', b_5 = '', b_6 = '';
var cccvvv = '';

int mx = -40;
int mn = 50;

double? longi;
double? lati;
var a;
var parsed_json;
var parsed_json2;
var bb;
var now;
String? tmx;
String? tmn;
String? cv;
String seasons = '겨울';

void conV() {
  cccvvv = cccvvv.substring(0, cccvvv.indexOf('.'));
  tmx0 = tmx0.substring(0, tmx0.indexOf('.'));
  tmn0 = tmn0.substring(0, tmn0.indexOf('.'));
}

void getLocation() async {
  print('날씨정보시작');
  try {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    longi = position.longitude;
    lati = position.latitude;
    var ddd = ConvGridGps.gpsToGRID(lati!, longi!);
    x = ddd[0];
    y = ddd[1];
  } catch (e) {
    print('There was a problem with the internet connection.');
  }

  //String abcd = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst?serviceKey=eFyj3ueBq5sCbBFscragz%2B1M3OlYKNvJNqK94YCpxqrcZzhz%2BRY62m3vDSdgKAIW%2FzN0SNKjb47FssGnIrN7Yg%3D%3D&numOfRows=10&pageNo=1&base_date=20221114&base_time=0600&nx=55&ny=127&dataType=JSON';
  //초단기실황
  String cho =
      'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst?serviceKey=eFyj3ueBq5sCbBFscragz%2B1M3OlYKNvJNqK94YCpxqrcZzhz%2BRY62m3vDSdgKAIW%2FzN0SNKjb47FssGnIrN7Yg%3D%3D&numOfRows=600&pageNo=1&base_date=$sday&base_time=$stime&nx=$x&ny=$y&dataType=JSON';
  Response response = await get(Uri.parse(cho));
  String jsonData = response.body;
  var parsingData = jsonDecode(jsonData);
  print(cho);
  //단기예보
  String dan =
      'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=eFyj3ueBq5sCbBFscragz%2B1M3OlYKNvJNqK94YCpxqrcZzhz%2BRY62m3vDSdgKAIW%2FzN0SNKjb47FssGnIrN7Yg%3D%3D&numOfRows=1000&pageNo=1&base_date=$yesterday&base_time=$baseTime&nx=$x&ny=$y&dataType=JSON';
  Response response2 = await get(Uri.parse(dan));
  String jsonData2 = response2.body;
  var parsingData2 = jsonDecode(jsonData2);

  print(dan);

  int totalCount = parsingData['response']['body']['totalCount'];
  int totalCount_dan = parsingData2['response']['body']['totalCount'];
  int t = 0;

  for (int i = 0; i < totalCount; i++) {
    parsed_json = parsingData['response']['body']['items']['item'][i];

    if (parsed_json['category'] == 'T1H' && t1h == '') {
      t1h = parsed_json['obsrValue']; //현재온도
      var s = double.parse(t1h);
      if (mx < s.round()) {
        mx = s.round();
      }
      if (mn > s.round()) {
        mn = s.round();
      }
    }
    if (parsed_json['category'] == 'WSD' && wsd == '') {
      wsd = parsed_json['obsrValue']; //풍속
    }
    if (parsed_json['category'] == 'REH' && reh == '') {
      reh = parsed_json['obsrValue']; //습도
    }
    if (parsed_json['category'] == 'RN1' && rn1 == '') {
      rn1 = parsed_json['obsrValue']; //강수량
    }
    if (parsed_json['category'] == 'PTY' && pty == '') {
      pty = parsed_json['obsrValue']; //현재강수
    }
  }

  for (int i = 0; i < totalCount_dan; i++) {
    parsed_json2 = parsingData2['response']['body']['items']['item'][i];
    if (parsed_json2['category'] == 'SKY' &&
        parsed_json2['fcstDate'] == today) {
      sky0 = (parsed_json2['fcstValue']); //하늘 상태
      break;
    }
  }
  skyState();
  for (int i = 0; i < totalCount_dan; i++) {
    parsed_json2 = parsingData2['response']['body']['items']['item'][i];
    if (parsed_json2['category'] == 'POP' &&
        parsed_json2['fcstDate'] == today) {
      pop0 = parsed_json2['fcstValue']; //내일 강수확률
    }
    if (parsed_json2['category'] == 'TMN' &&
        parsed_json2['fcstDate'] == today) {
      tmn0 = (parsed_json2['fcstValue']); //내일최저기온

    }
    if (parsed_json2['category'] == 'TMX' &&
        parsed_json2['fcstDate'] == today) {
      tmx0 = parsed_json2['fcstValue']; //내일최고기온

    }

    if (parsed_json2['category'] == 'POP' &&
        parsed_json2['fcstDate'] == tomorrow) {
      pop1 = parsed_json2['fcstValue']; //오늘 강수확률
    }
    if (parsed_json2['category'] == 'SKY' &&
        parsed_json2['fcstDate'] == tomorrow) {
      sky1 = (parsed_json2['fcstValue']); //하늘 상태
    }
    if (parsed_json2['category'] == 'TMN' &&
        parsed_json2['fcstDate'] == tomorrow) {
      tmn1 = (parsed_json2['fcstValue']); //내일최저기온
    }
    if (parsed_json2['category'] == 'TMX' &&
        parsed_json2['fcstDate'] == tomorrow) {
      tmx1 = parsed_json2['fcstValue']; //내일최고기온
    }

    if (parsed_json2['category'] == 'SKY' &&
        parsed_json2['fcstDate'] == ttomorrow) {
      sky2 = (parsed_json2['fcstValue']); //오늘하늘 상태
    }
    if (parsed_json2['category'] == 'TMN' &&
        parsed_json2['fcstDate'] == ttomorrow) {
      tmn2 = (parsed_json2['fcstValue']); //최저기온
    }
    if (parsed_json2['category'] == 'TMX' &&
        parsed_json2['fcstDate'] == ttomorrow) {
      tmx2 = parsed_json2['fcstValue']; //최고기온
    }
    if (parsed_json2['category'] == 'POP' &&
        parsed_json2['fcstDate'] == ttomorrow) {
      pop2 = parsed_json2['fcstValue']; //강수확률
    }

    var b_time1 = DateFormat('HH00').format(now.subtract(Duration(hours: 1)));
    if (parsed_json2['category'] == 'TMP' &&
        parsed_json2['fcstTime'] == b_time1 &&
        b_1 == '') {
      b_1 = parsed_json2['fcstValue']; //1시간후 온도
      if (mx < int.parse(parsed_json2['fcstValue'])) {
        mx = int.parse(parsed_json2['fcstValue']);
      }
      if (mn > int.parse(parsed_json2['fcstValue'])) {
        mn = int.parse(parsed_json2['fcstValue']);
      }
    }
    var b_time2 = DateFormat('HH00').format(now.subtract(Duration(hours: 2)));
    if (parsed_json2['category'] == 'TMP' &&
        parsed_json2['fcstTime'] == b_time2 &&
        b_2 == '') {
      b_2 = parsed_json2['fcstValue']; //1시간후 온도
      if (mx < int.parse(parsed_json2['fcstValue'])) {
        mx = int.parse(parsed_json2['fcstValue']);
      }
      if (mn > int.parse(parsed_json2['fcstValue'])) {
        mn = int.parse(parsed_json2['fcstValue']);
      }
    }
    var b_time3 = DateFormat('HH00').format(now.subtract(Duration(hours: 3)));
    if (parsed_json2['category'] == 'TMP' &&
        parsed_json2['fcstTime'] == b_time3 &&
        b_3 == '') {
      b_3 = parsed_json2['fcstValue']; //1시간후 온도
      if (mx < int.parse(parsed_json2['fcstValue'])) {
        mx = int.parse(parsed_json2['fcstValue']);
      }
      if (mn > int.parse(parsed_json2['fcstValue'])) {
        mn = int.parse(parsed_json2['fcstValue']);
      }
    }
    var b_time4 = DateFormat('HH00').format(now.subtract(Duration(hours: 4)));
    if (parsed_json2['category'] == 'TMP' &&
        parsed_json2['fcstTime'] == b_time4 &&
        b_4 == '') {
      b_4 = parsed_json2['fcstValue']; //1시간후 온도
      if (mx < int.parse(parsed_json2['fcstValue'])) {
        mx = int.parse(parsed_json2['fcstValue']);
      }
      if (mn > int.parse(parsed_json2['fcstValue'])) {
        mn = int.parse(parsed_json2['fcstValue']);
      }
    }
    var b_time5 = DateFormat('HH00').format(now.subtract(Duration(hours: 5)));
    if (parsed_json2['category'] == 'TMP' &&
        parsed_json2['fcstTime'] == b_time5 &&
        b_5 == '') {
      b_5 = parsed_json2['fcstValue']; //1시간후 온도
      if (mx < int.parse(parsed_json2['fcstValue'])) {
        mx = int.parse(parsed_json2['fcstValue']);
      }
      if (mn > int.parse(parsed_json2['fcstValue'])) {
        mn = int.parse(parsed_json2['fcstValue']);
      }
    }
    var b_time6 = DateFormat('HH00').format(now.subtract(Duration(hours: 6)));
    if (parsed_json2['category'] == 'TMP' &&
        parsed_json2['fcstTime'] == b_time6 &&
        b_6 == '') {
      b_6 = parsed_json2['fcstValue']; //1시간후 온도
      if (mx < int.parse(parsed_json2['fcstValue'])) {
        mx = int.parse(parsed_json2['fcstValue']);
      }
      if (mn > int.parse(parsed_json2['fcstValue'])) {
        mn = int.parse(parsed_json2['fcstValue']);
      }
    }

    var t_time1 = DateFormat('HH00').format(now.add(Duration(hours: 1)));
    if (parsed_json2['category'] == 'TMP' &&
        parsed_json2['fcstTime'] == t_time1 &&
        t_1 == '') {
      t_1 = parsed_json2['fcstValue']; //1시간후 온도
      if (mx < int.parse(parsed_json2['fcstValue'])) {
        mx = int.parse(parsed_json2['fcstValue']);
      }
      if (mn > int.parse(parsed_json2['fcstValue'])) {
        mn = int.parse(parsed_json2['fcstValue']);
      }
    }
    var t_time2 = DateFormat('HH00').format(now.add(Duration(hours: 2)));
    if (parsed_json2['category'] == 'TMP' &&
        parsed_json2['fcstTime'] == t_time2 &&
        t_2 == '') {
      t_2 = parsed_json2['fcstValue']; //1시간후 온도
      if (mx < int.parse(parsed_json2['fcstValue'])) {
        mx = int.parse(parsed_json2['fcstValue']);
      }
      if (mn > int.parse(parsed_json2['fcstValue'])) {
        mn = int.parse(parsed_json2['fcstValue']);
      }
    }
    var t_time3 = DateFormat('HH00').format(now.add(Duration(hours: 3)));
    if (parsed_json2['category'] == 'TMP' &&
        parsed_json2['fcstTime'] == t_time3 &&
        t_3 == '') {
      t_3 = parsed_json2['fcstValue']; //1시간후 온도
      if (mx < int.parse(parsed_json2['fcstValue'])) {
        mx = int.parse(parsed_json2['fcstValue']);
      }
      if (mn > int.parse(parsed_json2['fcstValue'])) {
        mn = int.parse(parsed_json2['fcstValue']);
      }
    }
    var t_time4 = DateFormat('HH00').format(now.add(Duration(hours: 4)));
    if (parsed_json2['category'] == 'TMP' &&
        parsed_json2['fcstTime'] == t_time4 &&
        t_4 == '') {
      t_4 = parsed_json2['fcstValue']; //1시간후 온도
      if (mx < int.parse(parsed_json2['fcstValue'])) {
        mx = int.parse(parsed_json2['fcstValue']);
      }
      if (mn > int.parse(parsed_json2['fcstValue'])) {
        mn = int.parse(parsed_json2['fcstValue']);
      }
    }
    var t_time5 = DateFormat('HH00').format(now.add(Duration(hours: 5)));
    if (parsed_json2['category'] == 'TMP' &&
        parsed_json2['fcstTime'] == t_time5 &&
        t_5 == '') {
      t_5 = parsed_json2['fcstValue']; //1시간후 온도
      if (mx < int.parse(parsed_json2['fcstValue'])) {
        mx = int.parse(parsed_json2['fcstValue']);
      }
      if (mn > int.parse(parsed_json2['fcstValue'])) {
        mn = int.parse(parsed_json2['fcstValue']);
      }
    }
    var t_time6 = DateFormat('HH00').format(now.add(Duration(hours: 6)));
    if (parsed_json2['category'] == 'TMP' &&
        parsed_json2['fcstTime'] == t_time6 &&
        t_6 == '') {
      t_6 = parsed_json2['fcstValue']; //1시간후 온도
      if (mx < int.parse(parsed_json2['fcstValue'])) {
        mx = int.parse(parsed_json2['fcstValue']);
      }
      if (mn > int.parse(parsed_json2['fcstValue'])) {
        mn = int.parse(parsed_json2['fcstValue']);
      }
    }
  }
  real_c();
  getMusic();
  print('날씨정보끝');
}

void superShortWeatherDate() {
  //45분 이전이면 현재 시보다 1시간 전 `base_time`을 요청한다.
  if (now.minute <= 30) {
    // 단. 00:45분 이전이라면 `base_date`는 전날이고 `base_time`은 2330이다.
    if (now.hour == 0) {
      sday = DateFormat('yyyyMMdd').format(now.subtract(Duration(days: 1)));
      stime = '2330';
    } else {
      sday = DateFormat('yyyyMMdd').format(now);
      stime = DateFormat('HH30').format(now.subtract(Duration(hours: 1)));
    }
  }
  //45분 이후면 현재 시와 같은 `base_time`을 요청한다.
  else {
    //if (now.minute > 45)
    sday = DateFormat('yyyyMMdd').format(now);
    stime = DateFormat('HH30').format(now);
  }
}

void shortWeatherDate() {
  if (now.hour < 2 || (now.hour == 2 && now.minute <= 10)) {
    //0시~2시 10분 사이 예보
    baseDate = yesterday; //어제 날짜
    baseTime = "2300";
  } else if (now.hour < 5 || (now.hour == 5 && now.minute <= 10)) {
    //2시 11분 ~ 5시 10분 사이 예보
    baseDate = today;
    baseTime = "0200";
  } else if (now.hour < 8 || (now.hour == 8 && now.minute <= 10)) {
    //5시 11분 ~ 8시 10분 사이 예보
    baseDate = today;
    baseTime = "0500";
  } else if (now.hour < 11 || (now.hour == 11 && now.minute <= 10)) {
    //8시 11분 ~ 11시 10분 사이 예보
    baseDate = today;
    baseTime = "0800";
  } else if (now.hour < 14 || (now.hour == 14 && now.minute <= 10)) {
    //11시 11분 ~ 14시 10분 사이 예보
    baseDate = today;
    baseTime = "1100";
  } else if (now.hour < 17 || (now.hour == 17 && now.minute <= 10)) {
    //14시 11분 ~ 17시 10분 사이 예보
    baseDate = today;
    baseTime = "1400";
  } else if (now.hour < 20 || (now.hour == 20 && now.minute <= 10)) {
    //17시 11분 ~ 20시 10분 사이 예보
    baseDate = today;
    baseTime = "1700";
  } else if (now.hour < 23 || (now.hour == 23 && now.minute <= 10)) {
    //20시 11분 ~ 23시 10분 사이 예보
    baseDate = today;
    baseTime = "2000";
  } else if (now.hour == 23 && now.minute >= 10) {
    //23시 11분 ~ 24시 사이 예보
    baseDate = today;
    baseTime = "2300";
  }
}

void api_convert() async {
  var gpsToGridData = ConvGridGps.gpsToGRID(35.144631, 129.035714);
}

void getDayTime() async {
  now = DateTime.now();
  today = DateFormat('yyyyMMdd').format(now);
  yesterday =
      DateFormat("yyyyMMdd").format(DateTime.now().subtract(Duration(days: 1)));
  tomorrow =
      DateFormat("yyyyMMdd").format(DateTime.now().add(Duration(days: 1)));
  ttomorrow =
      DateFormat("yyyyMMdd").format(DateTime.now().add(Duration(days: 2)));
  time = DateFormat('HHmm').format(now);
}

void real_c() {
  double w = double.parse(wsd);
  var sp = pow(w * 3.6, 0.16); //체감온도를 위한 풍속
  double cv1;
  cv1 = (13.12 +
      0.6215 * double.parse(t1h) -
      11.37 * sp +
      0.3965 * sp * double.parse(t1h)); //체감온도

  cccvvv = cv1.toString();
  conV();
}

var ssky = '';

void skyState() {
  if (pty == '0') {
    ssky = '맑음';
  }
  if (pty != '0') {
    ssky = '흐림';
  }
  if (pty == '0' && (sky0 == '1' || sky0 == '3')) {
    ssky = '맑음';
  }
  if (pty == '0' && sky0 == '4') {
    ssky = '흐림';
  }
  if (pty == '1' || pty == '2' || pty == '5' || pty == '6') {
    ssky = '비';
  }
  if (pty == '3' || pty == '7') {
    ssky = '눈';
  }
  print('하늘상태');
}
