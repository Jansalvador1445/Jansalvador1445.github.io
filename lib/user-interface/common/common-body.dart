import 'package:flutter/material.dart';
import 'common-project-items.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: dataprojects.projects
          .map((project) => ProjectItem(
              project: project, index: dataprojects.projects.indexOf(project)))
          .toList(),
    );
  }
}
