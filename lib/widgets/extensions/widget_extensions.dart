import 'package:flutter/cupertino.dart';

extension WidgetModifier on Widget {
  Widget paddingSymmetric({double horizontal = 16, double vertical = 8}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  Widget marginSymmetric({double horizontal = 0, double vertical = 0}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  Widget marginOnly({
    double top = 0,
    double bottom = 0,
    double left = 0,
    double right = 0,
  }) {
    return Container(
      margin:
      EdgeInsets.only(top: top, bottom: bottom, left: left, right: right),
      child: this,
    );
  }
}