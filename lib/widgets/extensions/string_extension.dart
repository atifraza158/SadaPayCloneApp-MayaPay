import 'package:flutter/material.dart';

extension StringsExtension on String {
  String getImagePathFromRoot() {
    return "assets/images/$this";
  }

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  bool isPhone() {
    String p = r'^(\+|^00|^0)[0-9]';
    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(this);
  }

  Widget loadImage(
      {num height = 100,
      num width = 100,
      num aspectRatio = 1,
      Color? color,
      BoxFit? fit}) {
    if (this.contains("https://")) {
      return Image.network(
        this,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return Image.asset(
            'assets/images/image_gallery.png',
            fit: BoxFit.cover,
          );
        },
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!.toInt()
                  : null,
            ),
          );
        },
      );
    } else {
      return Container(
        height: height.toDouble(),
        child: AspectRatio(
          aspectRatio: aspectRatio.toDouble(),
          child: Image.asset(
            this,
            height: height.toDouble(),
            color: color,
            width: width.toDouble(),
            fit: fit ?? BoxFit.contain,
          ),
        ),
      );
    }
  }
}
