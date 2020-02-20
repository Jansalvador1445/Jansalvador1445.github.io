import 'package:flutter/material.dart';
import 'package:website/user-interface/common/common-responsive.dart';
import 'package:website/user-interface/screen/screen-project-list.dart';
import 'package:website/utils/utils-clip-path.dart';
import 'package:website/utils/utils-colors.dart';

class Header extends StatelessWidget {
  //String
  final String _titleRole = "Jan Salvador Sebastian";
  final String _descriptionTitle = "Mobile Engineer";
  final String _projectTitles = 'PROJECTS';

  const Header();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: Colors.white,
        child: ClipPath(
          clipper: AppClipPath(AppClipPath.CLIP_BOTTOM),
          child: ResponsiveWidget(
            largeScreen: _largeScreen(context),
            smallScreen: _smallScreen(context),
          ),
        ),
      ),
      Positioned(
        bottom: 20,
        width: MediaQuery.of(context).size.width,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: RaisedButton(
            //onPressed: () {}, //() => _onClickNeedProject(context),
            disabledColor: AppColors.accent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            color: AppColors.accent,
            child: Text(
              _projectTitles,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.white,
                letterSpacing: 1.1,
              ),
            ),
          ),
        ),
      )
    ]);
  }

  Future<void> _showDialog(
      BuildContext context, String title, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(message),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _onClickNeedProject(BuildContext context) {
    _showDialog(context, _projectTitles, 'Comming Soon');
  }

  Widget _largeScreen(BuildContext context) {
    return Container(
      height: 500,
      child: Stack(children: <Widget>[
        Image.asset(
          'images/cover.jpg',
          alignment: Alignment.topLeft,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.blackTransparent,
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 5, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(15),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      OutlineButton(
                        onPressed: () {},
                        splashColor: AppColors.accent,
                        highlightedBorderColor: AppColors.accent,
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        child: Text(
                          "HOME",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      OutlineButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed(ProjectList.id),
                        splashColor: AppColors.accent,
                        highlightedBorderColor: AppColors.accent,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 2,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          "PROJECTS",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      OutlineButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed(ProjectList.id),
                        splashColor: AppColors.accent,
                        highlightedBorderColor: AppColors.accent,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 2,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          "CONTACT",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                _titleRole,
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                _descriptionTitle,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey[50],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _smallScreen(BuildContext context) {
    return Container(
      height: 450,
      child: Stack(children: [
        Image.asset(
          'images/cover.jpg',
          alignment: Alignment.bottomLeft,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.blackTransparent,
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 10, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
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
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                _titleRole,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                _descriptionTitle,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey[300],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
