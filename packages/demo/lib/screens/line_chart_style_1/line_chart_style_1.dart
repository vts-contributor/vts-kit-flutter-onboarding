import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vts_component/common/style/vts_color.dart';
import 'package:vts_component/components/line_chart_and_area_chart/axis/axis_chart_widgets.dart';
import 'package:vts_component/components/line_chart_and_area_chart/axis/axit_chart_data.dart';
import 'package:vts_component/components/line_chart_and_area_chart/base_chart/base_chart_data.dart';
import 'package:vts_component/components/line_chart_and_area_chart/line_chart/vts_line_chart.dart';
import 'package:vts_component/components/line_chart_and_area_chart/line_chart/vts_line_chart_data.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_box.dart';

import '../../components/demo_appbar.dart';

class LineChartStyle1 extends StatefulWidget {
  const LineChartStyle1({Key? key}) : super(key: key);

  @override
  State<LineChartStyle1> createState() => _LineChartStyle1State();
}

class OpenPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(150, 150), 10, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class OpenPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(150, 150), 8, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class OpenPainter3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(150, 150), 10, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class _LineChartStyle1State extends State<LineChartStyle1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DemoAppbar(title: 'Chart'),
        body: DemoBox(
            title: 'Line Chart Style 1',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  // padding: const EdgeInsets.only(top:  10, right: 10),
                  child: VTSLineChart(_lineCharData()), //
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.red,
                        ),
                        Text("Cate1")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.green,
                        ),
                        Text("Cate2")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.blue,
                        ),
                        Text("Cate3")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.yellow,
                        ),
                        Text("Cate4")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.purple,
                        ),
                        Text("Cate5")
                      ],
                    ),
                  ],
                ),
                // Divider(),
              ],
            )));
  }

  List<String> colors = ["Blue", "Green", "Yellow", "Purple", "Red"];

  List<LineTooltipItem> customTooltipIcon(List<LineBarSpot> touchedSpots) =>
      touchedSpots.map((LineBarSpot touchedSpot) {
        final textStyle = TextStyle(
          color: touchedSpot.bar.gradient?.colors.first ??
              touchedSpot.bar.color ??
              Colors.blueGrey,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        );
        return LineTooltipItem(
            "${colors[touchedSpot.barIndex]}: ${touchedSpot.y.toInt()}",
            textStyle);
      }).toList();

  VTSLine customizeGridLine(double value) => VTSLine(
        color: Colors.blueGrey,
        strokeWidth: 0.4,
        dashArray: [8, 0],
      );

  List<String> categories = [
    "Đường 1",
    "Đường 2",
    "Đường 3",
    "Đường 4",
    "Đường 5"
  ];

  Widget customGetTitle(double value, TitleMeta meta) => SideTitleWidget(
        axisSide: meta.axisSide,
        child: Text(
            // meta.formattedValue,
            categories[value.toInt()]),
      );

  VTSLineChartData _lineCharData() {
    return VTSLineChartData(
      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: VTSColors.FUNC_ORANGE_3,
          getTooltipItems: customTooltipIcon,
          fitInsideVertically: true,
          fitInsideHorizontally: true,
          tooltipRoundedRadius: 10,
          tooltipPadding: const EdgeInsets.all(20),
          tooltipMargin: 20,
          tooltipHorizontalAlignment: VTSHorizontalAlignment.center,
          rotateAngle: 0,
          tooltipBorder: const BorderSide(color: Colors.red),
        ),
        // touchCallback:  (TouchEvent event, LineTouchResponse? lineTouch){
        //   //to do
        // },
      ),
      gridData: VTSGridData(
        show: true,
        getDrawingHorizontalLine: customizeGridLine,
        drawHorizontalLine: true,
        drawVerticalLine: false,
      ),
      titlesData: VTSTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: customGetTitle,
              reservedSize: 30),
        ),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
          ),
        ),
      ),
      borderData: VTSBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: Colors.blue,
            width: 1,
            style: BorderStyle.solid,
          ),
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minY: 0,
      maxY: 1200,
      lineBarsData: linesBarData(),
    );
  }

  LineChartBarData initBarData(List<double> data, Color color) {
    List<VTSSpot> spots = [];
    for (int index = 0; index < data.length; index++) {
      spots.add(VTSSpot(1.0 * index, data[index]));
    }

    final LineChartBarData lineChartBarData = LineChartBarData(
      show: true,
      spots: spots,
      color: color,
      barWidth: 2,
      dotData: VTSDotData(
        show: true,
      ),
    );
    return lineChartBarData;
  }

  List<LineChartBarData> linesBarData() {
    var rng = Random();

    final LineChartBarData lineChartBarData5 = initBarData([
      rng.nextInt(1000).toDouble(),
      rng.nextInt(1000).toDouble(),
      rng.nextInt(1000).toDouble(),
      rng.nextInt(1000).toDouble(),
      rng.nextInt(1000).toDouble()
    ], Colors.red);
    final LineChartBarData lineChartBarData4 = initBarData([
      rng.nextInt(1000).toDouble(),
      rng.nextInt(1000).toDouble(),
      rng.nextInt(1000).toDouble(),
      rng.nextInt(1000).toDouble(),
      rng.nextInt(1000).toDouble()
    ], Colors.purple);
    final LineChartBarData lineChartBarData3 = initBarData([
      rng.nextInt(1000).toDouble(),
      rng.nextInt(1000).toDouble(),
      rng.nextInt(1000).toDouble(),
      rng.nextInt(1000).toDouble(),
      rng.nextInt(1000).toDouble()
    ], Colors.yellow);
    final LineChartBarData lineChartBarData2 = initBarData([
      rng.nextInt(1000).toDouble(),
      rng.nextInt(1000).toDouble(),
      rng.nextInt(1000).toDouble(),
      rng.nextInt(1000).toDouble(),
      rng.nextInt(1000).toDouble()
    ], Colors.green);
    final LineChartBarData lineChartBarData1 = initBarData([
      rng.nextInt(1000).toDouble(),
      rng.nextInt(1000).toDouble(),
      rng.nextInt(1000).toDouble(),
      rng.nextInt(1000).toDouble(),
      rng.nextInt(1000).toDouble()
    ], Colors.blue);

    return [
      lineChartBarData1,
      lineChartBarData2,
      lineChartBarData3,
      lineChartBarData4,
      lineChartBarData5
    ];
  }
}
