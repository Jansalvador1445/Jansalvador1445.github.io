import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:website/user-interface/common/common-responsive.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController;

    //Init State
    @override
    void initState() {
      super.initState();
      _scrollController = ScrollController();
    }

    ///Dispose
    @override
    void dispose() {
      _scrollController.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar:
            ResponsiveWidget.isSmallScreen(context) ? _drawerWidget() : null,
        floatingActionButton: FloatingActionButton(
          onPressed: () => html.window.open(
              "mailto:jansalvadorsebastian@gmail.com",
              "Jan Salvador Sebastian"),
          child: Icon(Icons.email),
          backgroundColor: Colors.redAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Header()
                // Body()
                // Footer()
              ],
            ),
          ],
        ),
      );
    }
  }

  //Drawer
  Widget _drawerWidget() {}
}
