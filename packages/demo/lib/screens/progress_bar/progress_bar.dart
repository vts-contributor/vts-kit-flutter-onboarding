import 'package:flutter/material.dart';
import 'package:vts_component/vts_component.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_box.dart';

class ProgressBarPage extends StatelessWidget {
  const ProgressBarPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DemoAppbar(title: 'Progress bar'),
      body: StreamBuilder<double>(
        stream: Stream.periodic(Duration(seconds: 1), (i) => i * 1.0)
            .takeWhile((value) => value <= 25),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                DemoBox(
                  title: "Circular Progress Bar (basic)",
                  child: VTSCircularProgressBar(
                      data: VTSProgressBarModel(
                    currentValue: snapshot.data! * 4,
                    maxValue: 100,
                    unit: "Kb",
                    label: "Title",
                    speedRate: 4,
                  )),
                ),
                //
                DemoBox(
                  title: "Linear Progress Bar (basic)",
                  child: VTSLinearProgressBar(
                      data: VTSProgressBarModel(
                    currentValue: snapshot.data! * 4,
                    maxValue: 100,
                    unit: "Kb",
                    label: "Title",
                    speedRate: 4,
                  )),
                ),
                //
                DemoBox(
                  title: "Circular Progress Bar (custom)",
                  child: VTSCircularProgressBar(
                      data: VTSProgressBarModel(
                    currentValue: snapshot.data! * 4,
                    maxValue: 100,
                    unit: "MB",
                    speedRate: 4,
                    backgroundColor: Colors.amber,
                    loadingColor: Colors.green,
                    unitTextStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.blue,
                    ),
                    fontSizePercentage: 13,
                  )),
                ),
                //
                DemoBox(
                  title: "Linear Progress Bar (custom)",
                  child: VTSLinearProgressBar(
                      data: VTSProgressBarModel(
                    currentValue: snapshot.data! * 4,
                    maxValue: 100,
                    unit: "Kg",
                    speedRate: 4,
                    backgroundColor: Colors.amber,
                    loadingColor: Colors.green,
                    labelStyle: TextStyle(fontStyle: FontStyle.italic),
                    unitTextStyle: TextStyle(fontSize: 10),
                    fontSizePercentage: 13,
                  )),
                ),
              ],
            );
          }
          return Text("Waiting for connection");
        },
      ),
    );
  }
}
