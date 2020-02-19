import 'package:flutter/material.dart';
import 'package:website/utils/utils-colors.dart';

class AppImage extends StatelessWidget {
  final String _path;

  AppImage(this._path);

  Future<void> _showDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Image.asset(_path),
          ),
          actions: <Widget>[
            Align(
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  color: AppColors.redAccent,
                  child: Text(
                    'CLOSE',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => _showDialog(context),
        child: Image.asset(
          _path,
        ));
  }
}
