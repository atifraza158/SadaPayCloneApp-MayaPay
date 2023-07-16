import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension ColorMyExtension on Color {
  Color get themeColor => Color.fromRGBO(10, 172, 173, 1);
  Color get whiteColor {
    if (Get.isDarkMode == true) {
      return Color(0xFF000000);
    } else {
      return Color(0xFFE9E9E9);
    }
  }

  Color get blackColor {
    if (Get.isDarkMode == true) {
      return Color(0xFFF1F3F6);
    } else {
      return Color(0xFF000000);
    }
  }

  Color get whiteFontColor => const Color(0xff2ffffff);
  Color get lightRedColor => const Color(0xFF2E000A);
  Color get greyColor => const Color(0xFF707070);
  Color get yellowColor => const Color(0xFFFD8100);
  Color get lightBlack => const Color(0xFF2E2925);
}

// bool light = false;

// class ThemeController extends GetxController {
//   RxBool light = false.obs;
//   changeTheme() {
    // if (light.value == true) {
    //   light.value = false;
    //   update();
    // } else if (light.value == false) {
    //   light.value = true;
    //   update();
    // }
//   }
// }

Map<int, Color> appThemeMap = {
  50: Color.fromRGBO(228, 0, 43, .1),
  100: Color.fromRGBO(228, 0, 43, .2),
  200: Color.fromRGBO(228, 0, 43, .3),
  300: Color.fromRGBO(228, 0, 43, .4),
  400: Color.fromRGBO(228, 0, 43, .5),
  500: Color.fromRGBO(228, 0, 43, .6),
  600: Color.fromRGBO(228, 0, 43, .7),
  700: Color.fromRGBO(228, 0, 43, .8),
  800: Color.fromRGBO(228, 0, 43, .9),
  900: Color.fromRGBO(228, 0, 43, 1),
};
MaterialColor appThemeColor = MaterialColor(0xFFE4002B, appThemeMap);
