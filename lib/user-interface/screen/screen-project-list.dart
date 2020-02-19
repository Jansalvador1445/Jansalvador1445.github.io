import 'package:flutter/material.dart';
import 'package:website/user-interface/common/common-project-items.dart';
import 'package:website/utils/utils-colors.dart';
import 'package:website/data/data-projects.dart' as dataprojects;

class ProjectList extends StatelessWidget {
  static const String id = "projects";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.accent,
          title: Text('Projects'),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: dataprojects.projects
                  .map((project) => ProjectItem(
                        project: project,
                        index: dataprojects.projects.indexOf(project),
                      ))
                  .toList(),
            ),
          ],
        ));
  }
}
