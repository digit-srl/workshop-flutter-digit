import 'package:flutter_web/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;

  const ResponsiveWidget(
      {Key key,
      @required this.largeScreen,
      this.mediumScreen,
      this.smallScreen})
      : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 800;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 800 &&
        MediaQuery.of(context).size.width < 1200;
  }

  static bool isSmallOrMediumScreen(BuildContext context) {
    return isSmallScreen(context) || isMediumScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          print("large");
          return largeScreen;
        } else if (constraints.maxWidth < 1200 && constraints.maxWidth > 800) {
          print("large");
          return mediumScreen ?? largeScreen;
        } else {
          print("medium");
          return smallScreen ?? mediumScreen ?? largeScreen;
        }
      },
    );
  }
}
