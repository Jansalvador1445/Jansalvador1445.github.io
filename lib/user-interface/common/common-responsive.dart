import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget _smallScreen;
  final Widget _mediumScreen;
  final Widget _largeScreen;

  const ResponsiveWidget(
    Key key,
    @required this._largeScreen,
    @required this._mediumScreen,
    @required this._smallScreen,
  ) : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 800;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 800 &&
        MediaQuery.of(context).size.width < 1200;
  }

  @override
  Widget build(BuildContext context) {}
}
