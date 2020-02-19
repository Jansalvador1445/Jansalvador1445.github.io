import 'package:flutter/material.dart';
import 'package:website/user-interface/screen/screen-home.dart';
import 'package:website/user-interface/screen/screen-project-list.dart';
import 'package:website/user-interface/screen/screen-project-preview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jan Salvador Sebastian / Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        ProjectList.id: (context) => ProjectList(),
        ProjectPreview.id: (context) => ProjectPreview(),
      },
      home: Home(),
    );
  }
}
