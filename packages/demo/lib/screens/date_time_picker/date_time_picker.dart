import 'package:flutter/material.dart';
import 'package:vts_component/vts_component.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_box.dart';

class DateTimePickerPage extends StatefulWidget {
  const DateTimePickerPage({Key? key}) : super(key: key);

  @override
  State<DateTimePickerPage> createState() => _DateTimePickerPageState();
}

class _DateTimePickerPageState extends State<DateTimePickerPage> {
  String data = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DemoAppbar(title: 'DateTime Picker'),
      body: DemoBox(
        child: VTSButton(
          text: 'Show picker',
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              builder: (_) => VTSDateTimePicker(
                showTime: true,
                onOK: (date) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${date.toString().split(' ')[0]} ${date.hour}: ${date.minute}',
                      ),
                    ),
                  );
                },
                onCancel: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Cancel nè')),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
