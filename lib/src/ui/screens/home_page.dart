import 'package:flutter_course/src/models/power.dart';
import 'package:flutter_course/src/ui/page_view_card.dart';
import 'package:flutter_web/material.dart';
import 'package:flutter_course/src/ui/responsive_layout.dart';

import 'dart:math' as Math;

import '../bottom_wave_clipper.dart';
import '../course_card.dart';
import '../item_course_widget.dart';
import '../item_power.dart';
import 'course_details.dart';
import 'package:flutter_course/src/models/course.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final int scaleFactor = Math.max(
      Math.max(
          courseList[0].description.length, courseList[1].description.length),
      courseList[2].description.length,
    );

    final titleStyle = TextStyle(
      fontSize: ResponsiveWidget.isSmallScreen(context)
          ? 20.0
          : ResponsiveWidget.isMediumScreen(context) ? 25.0 : 30.0,
      fontWeight: FontWeight.normal,
    );

    final card1 = Container(
      height: 280,
      margin: EdgeInsets.symmetric(
          vertical: ResponsiveWidget.isSmallScreen(context) ? 12.0 : 4.0,
          horizontal: ResponsiveWidget.isSmallScreen(context) ? 24.0 : 4.0),
      child: Card(
        elevation: 4.0,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Cosa rende unici i nostri corsi?",
                style: titleStyle,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Spacer(),
            ...coursePower
                .map(
                  (p) => ItemPower(
                    power: p,
                  ),
                )
                .toList(),
            Spacer(),
//            Padding(
//              padding: const EdgeInsets.all(4.0),
//              child: Column(
////                mainAxisAlignment: MainAxisAlignment.spaceAround,
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: power,
//              ),
//            ),
          ],
        ),
      ),
    );
    final card2 = Container(
      height: 280,
      margin: EdgeInsets.symmetric(
          vertical: ResponsiveWidget.isSmallScreen(context) ? 12.0 : 4.0,
          horizontal: ResponsiveWidget.isSmallScreen(context) ? 24.0 : 4.0),
      child: Card(
        elevation: 4.0,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Cosa riuscirai a fare dopo il corso?",
                style: titleStyle,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Spacer(),
            ...finalPowers
                .map(
                  (p) => ItemPower(
                    power: p,
                  ),
                )
                .toList(),
            Spacer(),
          ],
        ),
      ),
    );

    return Scaffold(
      body: ResponsiveWidget(
        largeScreen: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  child: Container(
                    height: ResponsiveWidget.isSmallScreen(context)
                        ? 450
                        : ResponsiveWidget.isMediumScreen(context)
                            ? 550
                            : 700.0,
                    color: Colors.blue,
                  ),
                  clipper: BottomWaveClipper(),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        "Flutter: App native in tempi record",
                        style: TextStyle(
                            fontSize: ResponsiveWidget.isSmallScreen(context)
                                ? 25.0
                                : 50.0,
                            color: Colors.white),
                      ),
                    ),
//                    PageViewCard(),
                    PageSelectorDemo(),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "logo_digit.png",
                          height: 90,
                          width: 90,
                        ),
                        Icon(Icons.add),
                        FlutterLogo(
                          size: 70,
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text:
                          "Digit SRL ha scelto Flutter come framework principale per lo sviluppo mobile\n",
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              "Esso ci permette di essere più produttivi e rende il nostro lavoro più piacevole!",
                          style: TextStyle(
                              fontSize: ResponsiveWidget.isSmallScreen(context)
                                  ? 18.0
                                  : 20.0,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    style: TextStyle(
                        fontSize: ResponsiveWidget.isSmallScreen(context)
                            ? 23.0
                            : 25.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
//                  Text(
//                    "Digit SRL ha scelto Flutter come framework principale per lo sviluppo mobile",
//                    style: TextStyle(fontSize: 25.0),
//                    textAlign: TextAlign.center,
//                  ),
//                  Text(
//                    "Esso ci permette di essere più produttivi e rende il nostro lavoro più piacevole!",
//                    style: TextStyle(fontSize: 20.0),
//                    textAlign: TextAlign.center,
//                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "I nostri corsi",
                      style: titleStyle,
                    ),
                  ),
                  ResponsiveWidget(
                    mediumScreen: Column(
                      children: courseList
                          .map(
                            (c) => GestureDetector(
                              onTap: () => showPopup(c, context),
                              child: CourseCard(
                                title: c.title,
                                description: c.description,
                                color: c.color,
                                scaleFactor: scaleFactor,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    largeScreen: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: courseList
                          .map(
                            (c) => Expanded(
                              child: GestureDetector(
//                                onTap: () => showPopup(c, context),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CourseDetailsScreen(
                                        course: c,
                                      ),
                                    ),
                                  );
                                },
//                                  onPressed: () => showPopup(c, context),
                                child: CourseCard(
                                  title: c.title,
                                  description: c.description,
                                  color: c.color,
                                  scaleFactor: scaleFactor,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "SEZIONE B",
                      style: titleStyle,
                    ),
                  ),
                  ResponsiveWidget(
                    largeScreen: Row(
                      children: <Widget>[
                        Expanded(child: card1),
                        Expanded(child: card2),
                      ],
                    ),
                    mediumScreen: Column(
                      children: <Widget>[
                        card1,
                        card2,
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  showPopup(Course course, BuildContext context) {
    final size = MediaQuery.of(context).size;
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Center(child: Text(course.title)),
          children: <Widget>[
            Container(
              width: size.width / 2,
              height: size.height / 1.5,
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  ...course.items
                      .map((item) => ItemCourseWidget(item: item))
                      .toList(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('${course.duration} ore'),
                Text('${course.price}€'),
              ],
            ),
          ],
        );
      },
    );
  }
}
