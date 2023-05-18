import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vts_component/vts_component.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_box.dart';

class AccordionPage extends StatefulWidget {
  @override
  _AccordionState createState() => _AccordionState();
}

class _AccordionState extends State<AccordionPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: DemoAppbar(title: 'Accordion'),
        body: ListView(
          children: <Widget>[
            DemoBox(
              title: "BASIC ACCORDION",
              child: VTSAccordion(
                  titleText: 'VTS Accordion',
                  contentText:
                      'Lorem ipsum dolor sit amet, consec tetura dipiscing elit. Eros, pellent esque orci vivam volutpat elementum id sed.'),
            ),
            DemoBox(
              title: "ACCORDION WITH TEXT",
              child: VTSAccordion(
                  titleText: 'VTS Accordion',
                  collapsedText: "Chi tiết",
                  expandedText: "Ẩn",
                  contentText:
                      'Lorem ipsum dolor sit amet, consec tetura dipiscing elit. Eros, pellent esque orci vivam volutpat elementum id sed.'),
            ),
            DemoBox(
                title: "ACCORDION WITH ICON",
                child: VTSAccordion(
                    titleText: 'VTS Accordion',
                    collapsedIcon: Icon(Icons.arrow_downward),
                    expandedIcon: Icon(Icons.arrow_upward),
                    contentText:
                        'Lorem ipsum dolor sit amet, consec tetura dipiscing elit. Eros, pellent esque orci vivam volutpat elementum id sed.')),
          ],
        ),
      );
}
