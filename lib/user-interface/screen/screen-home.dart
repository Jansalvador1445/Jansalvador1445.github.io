import 'package:flutter/material.dart';
import 'package:website/user-interface/common/common-body.dart';
import 'package:website/user-interface/common/common-footer.dart';
import 'package:website/user-interface/common/common-responsive.dart';
import 'package:website/user-interface/screen/screen-header.dart';
import 'package:website/user-interface/screen/screen-project-list.dart';
import 'package:website/utils/utils-colors.dart';
import 'dart:html' as html;

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: AppColors.accent,
            )
          : null,
      drawer: ResponsiveWidget.isSmallScreen(context) ? _drawer() : null,
      floatingActionButton: FloatingActionButton(
        onPressed: () => html.window.open(
            "mailto:jansalvadorsebastian@gmail.com", "Jan Salvador Sebastian"),
        child: Icon(Icons.sms),
        backgroundColor: AppColors.accent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      body: ListView(
        children: <Widget>[
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Header(), Body(), Footer()]),
        ],
      ),
    );
  }

  Widget _drawer() {
    return Drawer(
      child: Container(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.center,
                // decoration: BoxDecoration(
                //     gradient: LinearGradient(
                //         colors: <Color>[AppColors.accent, Colors.red[400]],
                //         begin: Alignment.topLeft,
                //         end: Alignment.bottomRight),
                //     shape: BoxShape.circle),
                child: Text(
                  'DM',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackTransparent,
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              title: Text(
                "HOME",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Colors.black87),
              ),
            ),
            ListTile(
              onTap: () => Navigator.of(context).pushNamed(ProjectList.id),
              title: Text(
                "PROJECTS",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Colors.black87),
              ),
            ),
            ListTile(
              onTap: () {},
              title: Text(
                "CONTACT",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
