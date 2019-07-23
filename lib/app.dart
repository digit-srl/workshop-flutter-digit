import 'package:flutter_course/src/ui/screens/home_page.dart';
import 'package:flutter_web/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.yellow,
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}