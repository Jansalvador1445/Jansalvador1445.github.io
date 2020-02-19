import 'package:flutter/material.dart';
import 'package:website/utils/utils-clip-path.dart';
import 'package:website/utils/utils-colors.dart';
import 'package:website/data/data-projects.dart' as dataprojects;
import 'dart:html' as html;

import 'common-responsive.dart';

class Footer extends StatelessWidget {
  final double iconSize = 35;

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          dataprojects.projects.length.isEven ? Colors.black87 : Colors.white,
      child: ClipPath(
        clipper: AppClipPath(AppClipPath.CLIP_TOP),
        child: ResponsiveWidget(
          largeScreen: _largeScreen(context),
          smallScreen: _smallScreen(context),
        ),
      ),
    );
  }

  Widget _largeScreen(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(children: [
        Image.asset(
          'images/cover.jpg',
          alignment: Alignment.bottomLeft,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Container(
          padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width / 5,
              left: MediaQuery.of(context).size.width / 5,
              bottom: 10),
          color: AppColors.blackTransparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('images/me.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  _socialIcons(),
                ],
              ),
              _copyRight()
            ],
          ),
        ),
      ]),
    );
  }

  Widget _smallScreen(BuildContext context) {
    return Container(
        color:
            dataprojects.projects.length.isEven ? Colors.black87 : Colors.white,
        height: 300,
        child: Stack(children: [
          Image.asset(
            'images/cover.jpg',
            alignment: Alignment.bottomLeft,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width / 20,
                left: MediaQuery.of(context).size.width / 20,
                bottom: 10),
            color: AppColors.blackTransparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('images/me.jpg'),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _socialIcons(),
                    ],
                  ),
                ),
                _copyRight()
              ],
            ),
          ),
        ]));
  }

  Widget _socialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: () =>
              html.window.open('https://github.com/GeekAbdelouahed', 'Github'),
          child: Image.asset(
            'images/github.png',
            height: iconSize,
            width: iconSize,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () => html.window.open(
              'https://www.linkedin.com/in/abdelouahed-medjoudja/', 'Linkedin'),
          child: Image.asset(
            'images/linkedin.png',
            height: iconSize,
            width: iconSize,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () => html.window.open(
              'https://www.facebook.com/AbdelouahedMedjoudja', 'Facebook'),
          child: Image.asset(
            'images/facebook.png',
            height: iconSize,
            width: iconSize,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () =>
              html.window.open('https://twitter.com/MedAbdelouahed', 'Twitter'),
          child: Image.asset(
            'images/twitter.png',
            height: iconSize,
            width: iconSize,
          ),
        ),
      ],
    );
  }

  Widget _copyRight() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Jan Salvador Sebastian - 2020',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          width: 5,
        ),
        Icon(
          Icons.copyright,
          size: 15,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () =>
              html.window.open('https://github.com/jansalvador1445', 'Github'),
          child: Text(
            'Github',
            style: TextStyle(
                decoration: TextDecoration.underline, color: Colors.white),
          ),
        )
      ],
    );
  }
}
