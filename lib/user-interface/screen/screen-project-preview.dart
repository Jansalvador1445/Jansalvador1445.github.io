import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:website/data/data-projects.dart';
import 'package:website/user-interface/common/common-app-image.dart';
import 'package:website/user-interface/common/common-responsive.dart';
import 'package:website/utils/utils-colors.dart';
import 'package:website/utils/utils-swipe.dart';

class ProjectPreview extends StatelessWidget {
  static const String id = "project_preview";

  final Color _primaryColor = Colors.black87;
  final Color _seconderyColor = Colors.grey[700];
  final Color _tagsColor = Colors.white;

  Project _project;

  @override
  Widget build(BuildContext context) {
    _project = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.accent,
        title: Text(_project.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: _tagsColor,
          child: ResponsiveWidget(
            largeScreen: _largeScreen(context),
            smallScreen: _smallScreen(context),
          ),
        ),
      ),
    );
  }

  Widget _largeScreen(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 5, vertical: 50),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                      height: 100, width: 100, child: AppImage(_project.logo)),
                  OutlineButton(
                    onPressed: () {
                      html.window.open(_project.link, _project.title);
                    },
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    borderSide: BorderSide(color: _primaryColor, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: Text(
                      'LIVE PREVIEW',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: _primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                _project.title,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: _primaryColor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                _project.description,
                style: TextStyle(
                  fontSize: 17,
                  color: _seconderyColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Wrap(
                  spacing: 10,
                  children: _project.tags
                      .map(
                        (tag) => Chip(
                          backgroundColor: _primaryColor,
                          label: Text(
                            tag,
                            style: TextStyle(color: _tagsColor),
                          ),
                        ),
                      )
                      .toList())
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Container(
              width: double.infinity,
              height: 500,
              child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: _project.images
                      .map((image) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: AppImage(image),
                          ))
                      .toList())),
        ],
      ),
    );
  }

  Widget _smallScreen(BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 10, vertical: 20),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(height: 100, width: 100, child: AppImage(_project.logo)),
              SizedBox(
                height: 20,
              ),
              Text(
                _project.title,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: _primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                _project.description,
                style: TextStyle(
                  fontSize: 17,
                  color: _seconderyColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              Wrap(
                  spacing: 10,
                  children: _project.tags
                      .map(
                        (tag) => Chip(
                          backgroundColor: _primaryColor,
                          label: Text(
                            tag,
                            style: TextStyle(color: _tagsColor),
                          ),
                        ),
                      )
                      .toList()),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 500,
                  child: Swiper(
                    itemCount: _project.images.length,
                    itemWidth: 250,
                    viewportFraction: .85,
                    scale: .9,
                    itemBuilder: (context, index) =>
                        Image.asset(_project.images[index]),
                  )),
              SizedBox(
                height: 20,
              ),
              OutlineButton(
                onPressed: () {
                  html.window.open(_project.link, _project.title);
                },
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                borderSide: BorderSide(color: _primaryColor, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Text(
                  'LIVE PREVIEW',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: _primaryColor,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
