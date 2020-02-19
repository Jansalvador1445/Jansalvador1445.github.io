import 'package:flutter/material.dart';

class AppClipPath extends CustomClipper<Path> {
  static final CLIP_BOTTOM = 1, CLIP_TOP = 2;
  final int _clipState;

  AppClipPath(this._clipState);

  @override
  Path getClip(Size size) {
    Path _path = Path();

    final _height = 1.2, _width = 2;

    if (_clipState == CLIP_BOTTOM) {
      _path.lineTo(0, size.height / _height);
      _path.quadraticBezierTo(
          size.width / _width, size.height, size.width, size.height / _height);
      _path.lineTo(size.width, 0);
      _path.close();
    } else {
      _path.lineTo(0, size.height - size.height / _height);
      _path.quadraticBezierTo(size.width - size.width / _width, 0, size.width,
          size.height - size.height / _height);
      _path.lineTo(size.width, size.height);
      _path.lineTo(0, size.height);
      _path.close();
    }

    return _path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

  bool _isLargeScreen(Size size) {
    return size.width > 800;
  }
}
