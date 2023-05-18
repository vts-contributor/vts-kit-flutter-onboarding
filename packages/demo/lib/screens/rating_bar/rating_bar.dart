import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vts_component/vts_component.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_box.dart';

class RatingBarPage extends StatefulWidget {
  @override
  State<RatingBarPage> createState() => _RatingBarPageState();
}

class _RatingBarPageState extends State<RatingBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DemoAppbar(title: "VTS Rating Bar"),
      body: Column(
        children: [
          DemoBox(
            title: "Custom rating (only 1 icon shines)",
            child: VTSRatingBar.builder(
              initialRating: 2,
              itemCount: 3,
              itemSize: (MediaQuery.of(context).size.width - 100) / 3,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return _buildRatingWidget("lib/assets/icons/sad.svg",
                        "Không hài lòng", Colors.red);
                  case 1:
                    return _buildRatingWidget("lib/assets/icons/smile.svg",
                        "Bình thường", Colors.amber);
                  default:
                    return _buildRatingWidget("lib/assets/icons/big_smile.svg",
                        "Hài lòng", Color.fromARGB(255, 13, 129, 21));
                }
              },
              onRatingUpdate: (rating) {},
              isShowOnly1Rating: true,
            ),
          ),
          //
          DemoBox(
            title: "Custom rating (icons from left to current shine)",
            child: VTSRatingBar.builder(
              initialRating: 2,
              itemCount: 3,
              itemSize: (MediaQuery.of(context).size.width - 100) / 3,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return _buildRatingWidget("lib/assets/icons/sad.svg",
                        "Không hài lòng", Colors.red);
                  case 1:
                    return _buildRatingWidget("lib/assets/icons/smile.svg",
                        "Bình thường", Colors.amber);
                  default:
                    return _buildRatingWidget("lib/assets/icons/big_smile.svg",
                        "Hài lòng", Color.fromARGB(255, 13, 129, 21));
                }
              },
              onRatingUpdate: (rating) {},
            ),
          ),
          //
          DemoBox(
            title: "Basic rating (allow half rating)",
            child: VTSRatingBar(
              initialRating: 1.5,
              itemCount: 5,
              onRatingUpdate: (value) {},
              ratingWidget: VTSRatingWidget(
                full: Icon(Icons.star_rounded, color: Colors.amber),
                empty: Icon(Icons.star_rounded, color: Colors.grey),
                half: Icon(Icons.star_half_rounded, color: Colors.amber),
              ),
              allowHalfRating: true,
            ),
          ),
          //
          DemoBox(
            title: "Basic rating (NO allow half rating)",
            child: VTSRatingBar(
              initialRating: 1.5,
              itemCount: 5,
              onRatingUpdate: (value) {},
              ratingWidget: VTSRatingWidget(
                full: Icon(Icons.star_rounded, color: Colors.amber),
                empty: Icon(Icons.star_rounded, color: Colors.grey),
                half: Icon(Icons.star_half_rounded, color: Colors.amber),
              ),
              allowHalfRating: false,
            ),
          ),
          //
          DemoBox(
            title: "Basic rating (read only)",
            child: VTSRatingBar(
              initialRating: 1.5,
              itemCount: 5,
              onRatingUpdate: (value) {},
              ratingWidget: VTSRatingWidget(
                full: Icon(Icons.star_rounded, color: Colors.amber),
                empty: Icon(Icons.star_rounded, color: Colors.grey),
                half: Icon(Icons.star_half_rounded, color: Colors.amber),
              ),
              allowHalfRating: false,
              disabled: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingWidget(String assetPath, String description, Color color) {
    return SizedBox(
      child: Container(
        height: 62,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              assetPath,
              width: 30,
              height: 30,
              color: color,
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 12, color: color),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
