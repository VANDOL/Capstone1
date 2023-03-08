import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  List<int> get showIndexes => const [1, 3, 5];
  List<FlSpot> get allSpots => const [
        FlSpot(0, 1),
        FlSpot(1, 2),
        FlSpot(2, 1.5),
        FlSpot(3, 3),
        FlSpot(4, 3.5),
        FlSpot(5, 5),
        FlSpot(6, 8),
      ];

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.blueGrey,
      fontFamily: 'Digital',
      fontSize: 10,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '00:00';
        break;
      case 1:
        text = '04:00';
        break;
      case 2:
        text = '08:00';
        break;
      case 3:
        text = '12:00';
        break;
      case 4:
        text = '16:00';
        break;
      case 5:
        text = '20:00';
        break;
      case 6:
        text = '23:59';
        break;
      default:
        return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lineBarsData = [
      LineChartBarData(
        showingIndicators: showIndexes,
        spots: allSpots,
        isCurved: true,
        barWidth: 4,
        shadow: const Shadow(
          blurRadius: 8,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors: [
              const Color(0xff12c2e9).withOpacity(0.4),
              const Color(0xffc471ed).withOpacity(0.4),
              const Color(0xfff64f59).withOpacity(0.4),
            ],
          ),
        ),
        dotData: FlDotData(show: false),
        gradient: const LinearGradient(
          colors: [
            Color(0xff12c2e9),
            Color(0xffc471ed),
            Color(0xfff64f59),
          ],
          stops: [0.1, 0.4, 0.9],
        ),
      ),
    ];

    final tooltipsOnBar = lineBarsData[0];

    return SizedBox(
      width: 300,
      height: 140,
      child: LineChart(
        LineChartData(
          showingTooltipIndicators: showIndexes.map((index) {
            return ShowingTooltipIndicators([
              LineBarSpot(
                tooltipsOnBar,
                lineBarsData.indexOf(tooltipsOnBar),
                tooltipsOnBar.spots[index],
              ),
            ]);
          }).toList(),
          lineTouchData: LineTouchData(
            enabled: false,
            getTouchedSpotIndicator:
                (LineChartBarData barData, List<int> spotIndexes) {
              return spotIndexes.map((index) {
                return TouchedSpotIndicatorData(
                  FlLine(
                    color: Colors.pink,
                  ),
                  FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, barData, index) =>
                        FlDotCirclePainter(
                      radius: 8,
                      strokeWidth: 2,
                      strokeColor: Colors.black,
                    ),
                  ),
                );
              }).toList();
            },
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Colors.pink,
              tooltipRoundedRadius: 10,
              getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                return lineBarsSpot.map((lineBarSpot) {
                  return LineTooltipItem(
                    lineBarSpot.y.toString(),
                    const TextStyle(
                      color: Color.fromARGB(255, 81, 90, 129),
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }).toList();
              },
            ),
          ),
          lineBarsData: lineBarsData,
          minY: 0,
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
                reservedSize: 0,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: bottomTitleWidgets,
              ),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
                reservedSize: 0,
              ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 0,
              ),
            ),
          ),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(
            show: true,
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: Text('세번째 페이지'),
  //     ),
  //   );
  // }
}


// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// class FirstPage extends StatefulWidget {
//   @override
//   _FirstPageState createState() => _FirstPageState();
// }

// class _FirstPageState extends State<FirstPage> {
//   List<Color> gradientColors = [
//     const Color(0xff23b6e6),
//     const Color(0xff02d39a),
//   ];

//   bool showAvg = false;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         AspectRatio(
//           aspectRatio: 1.70,
//           child: DecoratedBox(
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(50),
//               ),
//               color: Color(0xff232d37),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.only(
//                 right: 18,
//                 left: 12,
//                 top: 24,
//                 bottom: 12,
//               ),
//               child: LineChart(
//                 mainData(),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget bottomTitleWidgets(double value, TitleMeta meta) {
//     const style = TextStyle(
//       color: Color(0xff68737d),
//       fontWeight: FontWeight.bold,
//       fontSize: 15,
//     );
//     Widget text;
//     switch (value.toInt()) {
//       case 0:
//         text = const Text('00', style: style);
//         break;
//       case 1:
//         text = const Text('01', style: style);
//         break;
//       case 2:
//         text = const Text('02', style: style);
//         break;
//       case 3:
//         text = const Text('03', style: style);
//         break;
//       case 4:
//         text = const Text('04', style: style);
//         break;
//       case 5:
//         text = const Text('05', style: style);
//         break;
//       case 6:
//         text = const Text('06', style: style);
//         break;
//       case 7:
//         text = const Text('07', style: style);
//         break;
//       case 8:
//         text = const Text('08', style: style);
//         break;
//       case 9:
//         text = const Text('09', style: style);
//         break;
//       case 10:
//         text = const Text('10', style: style);
//         break;
//       case 11:
//         text = const Text('11', style: style);
//         break;
//       case 12:
//         text = const Text('12', style: style);
//         break;
//       default:
//         text = const Text('', style: style);
//         break;
//     }

//     return SideTitleWidget(
//       axisSide: meta.axisSide,
//       child: text,
//     );
//   }

//   Widget leftTitleWidgets(double value, TitleMeta meta) {
//     const style = TextStyle(
//       color: Color(0xff67727d),
//       fontWeight: FontWeight.bold,
//       fontSize: 15,
//     );
//     String text;
//     switch (value.toInt()) {
//       case 1:
//         text = '5°';
//         break;
//       case 3:
//         text = '10°';
//         break;
//       case 5:
//         text = '15°';
//         break;
//       default:
//         return Container();
//     }

//     return Text(text, style: style, textAlign: TextAlign.left);
//   }

//   LineChartData mainData() {
//     return LineChartData(
//       gridData: FlGridData(
//         show: true,
//         drawVerticalLine: false,
//         drawHorizontalLine: false,
//         horizontalInterval: 1,
//         verticalInterval: 1,
//         getDrawingHorizontalLine: (value) {
//           return FlLine(
//             color: Color.fromARGB(255, 134, 161, 184),
//             strokeWidth: 1,
//           );
//         },
//         getDrawingVerticalLine: (value) {
//           return FlLine(
//             color: Color.fromARGB(255, 104, 149, 185),
//             strokeWidth: 1,
//           );
//         },
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         rightTitles: AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         topTitles: AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         bottomTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             reservedSize: 30,
//             interval: 1,
//             getTitlesWidget: bottomTitleWidgets,
//           ),
//         ),
//         leftTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             interval: 1,
//             getTitlesWidget: leftTitleWidgets,
//             reservedSize: 42,
//           ),
//         ),
//       ),
//       borderData: FlBorderData(
//         show: true,
//         border: Border.all(color: Color.fromARGB(255, 51, 61, 71)),
//       ),
//       minX: 0,
//       maxX: 12,
//       minY: 0,
//       maxY: 6,
//       lineBarsData: [
//         LineChartBarData(
//           showingIndicators: [],
//           spots: const [
//             FlSpot(0, 1),
//             FlSpot(1, 2),
//             FlSpot(2, 2.8),
//             FlSpot(3, 3.1),
//             FlSpot(4, 4),
//             FlSpot(5, 4.1),
//             FlSpot(6, 4.2),
//             FlSpot(7, 4.7),
//             FlSpot(8, 5),
//             FlSpot(9, 4.1),
//             FlSpot(10, 3.9),
//             FlSpot(11, 2.7),
//             FlSpot(12, 1),
//           ],
//           isCurved: true,
//           gradient: LinearGradient(
//             colors: gradientColors,
//           ),
//           barWidth: 5,
//           isStrokeCapRound: true,
//           dotData: FlDotData(
//             show: true,
//           ),
//           belowBarData: BarAreaData(
//             show: true,
//             gradient: LinearGradient(
//               colors: gradientColors
//                   .map((color) => color.withOpacity(0.3))
//                   .toList(),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
