import 'package:flutter/material.dart';
import 'dart:html' as html;

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
        appBar: ResponsiveWidget,
      );
    }
  }
}
