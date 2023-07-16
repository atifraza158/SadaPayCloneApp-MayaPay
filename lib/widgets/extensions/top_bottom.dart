import 'package:flutter/material.dart';
import 'package:maya_pay/widgets/extensions/colors_extensions.dart';

import 'package:maya_pay/widgets/extensions/textstyles_extensions.dart';

class TopBottomAres {
  Widget buildTopBar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).padding.top,
      color: color.themeColor,
    );
  }

  Widget buildBottomBar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).padding.bottom,
      color: color.themeColor,
    );
  }
}
