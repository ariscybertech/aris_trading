import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trading_application/constants/constants.dart';


class ViewLineChart extends StatefulWidget {
  @override
  _ViewLineChartState createState() => _ViewLineChartState();
}

class _ViewLineChartState extends State<ViewLineChart> {
  List<Color> gradientColors = [
     primary,
     white,
  ];


  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(18),
          ),),
      child: Padding(
        padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
        child: LineChart(
           mainData(),
        ),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      backgroundColor: white,
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.transparent,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.transparent,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) =>
          const TextStyle(color: grey, fontWeight: FontWeight.w400, fontSize: 14),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'Sun';
              case 4:
                return 'Mon';
              case 7:
                return 'Tue';
              case 10:
                return 'Wed';
              case 13:
                return 'Thr';
              case 16:
                return 'Fri';
              case 19:
                return 'Sat';
            }
            return '';
          },
          margin: 8,

        ),
        leftTitles: SideTitles(
          showTitles: false,
          getTextStyles: (value) => const TextStyle(
            color: grey,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData:
      FlBorderData(show: false,),
      minX: 0,
      maxX: 20,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(4, 2),
            FlSpot(9, 4),
            FlSpot(12, 3),
            FlSpot(15, 5),
            FlSpot(18, 3),
            FlSpot(20, 4),
          ],
          isCurved: true,
          colors: [primary],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
            gradientFrom: Offset(0,0),
            gradientTo: Offset(0,1.5),
          ),
        ),
      ],
    );
  }

}