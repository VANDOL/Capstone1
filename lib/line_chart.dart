import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:path/path.dart';
import 'loading.dart';

var tt = double.parse(t1h);

List<int> get showIndexes => const [6];
List<FlSpot> get allSpots => [
      FlSpot(0, double.parse(b_6)),
      FlSpot(1, double.parse(b_5)),
      FlSpot(2, double.parse(b_4)),
      FlSpot(3, double.parse(b_3)),
      FlSpot(4, double.parse(b_2)),
      FlSpot(5, double.parse(b_1)),
      FlSpot(6, double.parse(t1h)),
      FlSpot(7, double.parse(t_1)),
      FlSpot(8, double.parse(t_2)),
      FlSpot(9, double.parse(t_3)),
      FlSpot(10, double.parse(t_4)),
      FlSpot(11, double.parse(t_5)),
      FlSpot(12, double.parse(t_6)),
    ];

double ttmx = double.parse(tmx0);
double ttmn = double.parse(tmn0);

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 255, 255, 255),
    fontSize: 12,
  );
  String text;
  switch (value.toInt()) {
    case 0:
      text = ((now.hour + 18) % 24).toString();
      break;
    case 1:
      text = ((now.hour + 19) % 24).toString();
      break;
    case 2:
      text = ((now.hour + 20) % 24).toString();
      break;
    case 3:
      text = ((now.hour + 21) % 24).toString();
      break;
    case 4:
      text = ((now.hour + 22) % 24).toString();
      break;
    case 5:
      text = ((now.hour + 23) % 24).toString();
      break;
    case 6:
      text = '현재';
      break;
    case 7:
      text = ((now.hour + 25) % 24).toString();
      break;
    case 8:
      text = ((now.hour + 26) % 24).toString();
      break;
    case 9:
      text = ((now.hour + 27) % 24).toString();
      break;
    case 10:
      text = ((now.hour + 28) % 24).toString();
      break;
    case 11:
      text = ((now.hour + 29) % 24).toString();
      break;
    case 12:
      text = ((now.hour + 30) % 24).toString();
      break;
    default:
      return Container();
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: Text(text, style: style),
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 255, 255, 255),
    fontSize: 12,
  );
  int a = value.toInt();
  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: Text('${a}', style: style),
  );
}

final lineBarsData = [
  LineChartBarData(
    showingIndicators: showIndexes,
    spots: allSpots,
    isCurved: true,
    barWidth: 3,
    belowBarData: BarAreaData(
      show: false,
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

Widget lineChart() => LineChart(
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
          enabled: true,
          getTouchedSpotIndicator:
              (LineChartBarData barData, List<int> spotIndexes) {
            return spotIndexes.map((index) {}).toList();
          },
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Color.fromARGB(75, 252, 235, 233),
            tooltipRoundedRadius: 10,
            getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
              return lineBarsSpot.map((lineBarSpot) {
                return LineTooltipItem(
                  lineBarSpot.y.toString(),
                  const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                  ),
                );
              }).toList();
            },
          ),
        ),
        lineBarsData: lineBarsData,
        maxY: mx + 2,
        minY: mn - 2,
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 2,
              getTitlesWidget: leftTitleWidgets,
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
              showTitles: false,
              interval: 1,
            ),
          ),
        ),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(
          show: false,
        ),
      ),
    );

Widget bottomTitleWidgets_b(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 0, 0, 0),
    fontSize: 12,
  );
  String text;
  switch (value.toInt()) {
    case 0:
      text = ((now.hour + 18) % 24).toString();
      break;
    case 1:
      text = ((now.hour + 19) % 24).toString();
      break;
    case 2:
      text = ((now.hour + 20) % 24).toString();
      break;
    case 3:
      text = ((now.hour + 21) % 24).toString();
      break;
    case 4:
      text = ((now.hour + 22) % 24).toString();
      break;
    case 5:
      text = ((now.hour + 23) % 24).toString();
      break;
    case 6:
      text = '현재';
      break;
    case 7:
      text = ((now.hour + 25) % 24).toString();
      break;
    case 8:
      text = ((now.hour + 26) % 24).toString();
      break;
    case 9:
      text = ((now.hour + 27) % 24).toString();
      break;
    case 10:
      text = ((now.hour + 28) % 24).toString();
      break;
    case 11:
      text = ((now.hour + 29) % 24).toString();
      break;
    case 12:
      text = ((now.hour + 30) % 24).toString();
      break;
    default:
      return Container();
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: Text(text, style: style),
  );
}

Widget leftTitleWidgets_b(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 0, 0, 0),
    fontSize: 12,
  );
  int a = value.toInt();
  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: Text('${a}', style: style),
  );
}

Widget lineChart_b() => LineChart(
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
          enabled: true,
          getTouchedSpotIndicator:
              (LineChartBarData barData, List<int> spotIndexes) {
            return spotIndexes.map((index) {}).toList();
          },
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Color.fromARGB(75, 252, 235, 233),
            tooltipRoundedRadius: 10,
            getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
              return lineBarsSpot.map((lineBarSpot) {
                return LineTooltipItem(
                  lineBarSpot.y.toString(),
                  const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                );
              }).toList();
            },
          ),
        ),
        lineBarsData: lineBarsData,
        maxY: mx + 2,
        minY: mn - 2,
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 2,
              getTitlesWidget: leftTitleWidgets_b,
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: bottomTitleWidgets_b,
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
              showTitles: false,
              interval: 1,
            ),
          ),
        ),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(
          show: false,
        ),
      ),
    );
