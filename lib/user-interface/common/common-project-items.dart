import 'package:flutter/material.dart';
import 'package:website/data/data-projects.dart';
import 'package:website/user-interface/screen/screen-project-preview.dart';
import 'package:website/utils/utils-swipe.dart';
import 'common-app-image.dart';
import 'common-responsive.dart';

class ProjectItem extends StatefulWidget {
  final Project project;
  final int index;

  const ProjectItem({Key key, this.project, this.index}) : super(key: key);

  @override
  _ProjectItemState createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  Color _primaryColor;
  Color _seconderyColor;
  Color _tagsColor;

  @override
  void initState() {
    super.initState();
    _primaryColor = widget.index.isEven ? Colors.black87 : Colors.white;
    _seconderyColor = widget.index.isEven ? Colors.grey[700] : Colors.grey[300];
    _tagsColor = widget.index.isEven ? Colors.white : Colors.black87;
  }

  void _onClickPreview(BuildContext context) {
    Navigator.of(context)
        .pushNamed(ProjectPreview.id, arguments: widget.project);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _tagsColor,
      child: ResponsiveWidget(
        largeScreen: _largeScreen(context),
        smallScreen: _smallScreen(context),
      ),
    );
  }

  Widget _largeScreen(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 5, vertical: 50),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 300,
              height: 500,
              child: Swiper(
                itemCount: widget.project.images.length,
                itemWidth: 250,
                viewportFraction: .85,
                scale: .9,
                itemBuilder: (context, index) =>
                    AppImage(widget.project.images[index]),
              )),
          SizedBox(
            width: 50,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.project.title,
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
                      widget.project.description,
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
                        children: widget.project.tags
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
                  height: 200,
                ),
                OutlineButton(
                  onPressed: () => _onClickPreview(context),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  borderSide: BorderSide(color: _primaryColor, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23),
                  ),
                  child: Text(
                    'PREVIEW',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: _primaryColor,
                    ),
                  ),
                )
              ],
            ),
          )
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
              Container(
                  height: 500,
                  child: Swiper(
                    itemCount: widget.project.images.length,
                    itemWidth: 250,
                    viewportFraction: .85,
                    scale: .9,
                    itemBuilder: (context, index) =>
                        Image.asset(widget.project.images[index]),
                  )),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.project.title,
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
                widget.project.description,
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
                  children: widget.project.tags
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
              OutlineButton(
                onPressed: () => _onClickPreview(context),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                borderSide: BorderSide(color: _primaryColor, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Text(
                  'PREVIEW',
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
