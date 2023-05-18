import 'package:flutter/material.dart';
import 'package:vts_component/vts_component.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_box.dart';

class PieChartPage extends StatefulWidget {
  const PieChartPage({Key? key}) : super(key: key);

  @override
  State<PieChartPage> createState() => _PieChartPageState();
}

class _PieChartPageState extends State<PieChartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DemoAppbar(title: 'Pie Chart'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DemoBox(
                child: VTSPieChart(
                  dataset: [
                    VTSPieChartDataItem(
                      value: 10,
                      label: 'Series 1',
                      color: Colors.pink,
                    ),
                    VTSPieChartDataItem(
                      value: 20,
                      label: 'Series 2',
                      color: Colors.blue,
                    ),
                    VTSPieChartDataItem(
                      value: 30,
                      label: 'Series 3',
                      color: Colors.brown,
                    ),
                    VTSPieChartDataItem(
                      value: 40,
                      label: 'Series 4',
                      color: Colors.green,
                    ),
                  ],
                  onSectionClicked: (item) => print(item.toString()),
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Divider(height: 3),
              DemoBox(
                child: VTSPieChart(
                  dataset: [
                    VTSPieChartDataItem(
                      value: 10,
                      label: 'Series 1',
                      color: Colors.pink,
                    ),
                    VTSPieChartDataItem(
                      value: 20,
                      label: 'Series 2',
                      color: Colors.blue,
                    ),
                    VTSPieChartDataItem(
                      value: 30,
                      label: 'Series 3',
                      color: Colors.brown,
                    ),
                    VTSPieChartDataItem(
                      value: 40,
                      label: 'Series 4',
                      color: Colors.green,
                    ),
                  ],
                  onSectionClicked: (item) => print(item.toString()),
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  isDonut: true,
                  donutTitle: '15.236',
                  donutSubTitle: 'Browsers',
                  donutTitleStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Sarabun',
                  ),
                  donutSubTitleStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Sarabun',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
