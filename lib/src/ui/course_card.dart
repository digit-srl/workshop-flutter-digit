import 'package:flutter_web/material.dart';
import 'dart:math' as Math;
import 'package:flutter_course/src/ui/responsive_layout.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String description;
  final MaterialColor color;
  final Function moreInfo;
  final int scaleFactor;

  const CourseCard(
      {Key key,
      this.title,
      this.color,
      this.description,
      this.moreInfo,
      this.scaleFactor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: ResponsiveWidget.isSmallScreen(context) ? 12.0 : 4.0,
          horizontal: ResponsiveWidget.isSmallScreen(context) ? 24.0 : 4.0),
      child: AspectRatio(
        aspectRatio: 2,
        child: Card(
          elevation: 4.0,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: ResponsiveWidget.isMediumScreen(context) ? 22.0 : 16.0,
              horizontal: 4.0,
            ),
            decoration: BoxDecoration(
              // Box decoration takes a gradient
              gradient: LinearGradient(
                // Where the linear gradient begins and ends
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                // Add one stop for each color. Stops should increase from 0 to 1
                stops: [0.1, 0.5, 0.7, 1.0],
                colors: [
                  color[500],
                  color[400],
                  color[300],
                  color[200],
                ],
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
//                print(constraints.maxWidth);
//                print(constraints.maxHeight);
                final area = constraints.maxHeight * constraints.maxWidth;
//                final n = description.length;
                final fontSize = ((Math.sqrt(area) / scaleFactor) * 2100)
                        .toInt()
                        .toDouble() /
                    100;
                print("area $area");
                final x = area / scaleFactor;
                print("aadfda $x");
                print("fontSize: $fontSize");
//                final tmp =
//                    97 + (-904.7 - 97.05) / (1 + Math.pow((x / 11.79), 0.07868167));
//                    17 + (11.2 - 17.1) / (1 + Math.pow((x / 168.5), 6.15));
                //y = 97.05469 + (-904.7597 - 97.05469)/(1 + (x/8.579332e-12)^0.07868167)
//                print("nuovo font: $tmp");
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: fontSize + 1,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: fontSize,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  getFontSize(double area) {
    if (area > 240) {
      print(16.5);
      return 16.5;
    } else if (area > 220) {
      print(15.5);
      return 15.5;
    } else if (area > 185) {
      print(15.0);
      return 15.0;
    } else if (area > 150) {
      print(13.5);
      return 13.5;
    } else if (area > 100) {
      print(11.5);
      return 11.5;
    }
    print('default');
    return 1.0;
  }
}
//              Align(
//                alignment: Alignment.bottomRight,
//                child: Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: GestureDetector(
//                    onTap: moreInfo,
//                    child: Text(
//                      "More info",
//                      style: TextStyle(
//                        color: Colors.white,
//                        fontSize: ResponsiveWidget.isMediumScreen(context)
//                            ? 12.0
//                            : 16.0,
//                        fontWeight: FontWeight.bold,
//                      ),
//                    ),
//                  ),
//                ),
//              ),
