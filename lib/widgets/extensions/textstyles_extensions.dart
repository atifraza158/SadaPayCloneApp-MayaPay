import 'package:flutter/material.dart';
import 'package:maya_pay/widgets/extensions/colors_extensions.dart';
import 'package:sizer/sizer.dart';

Color color = const Color(0xFFFFFFFF);

extension TextStyleMyExtension on TextStyle {
  TextStyle get splashScreenName {
    return TextStyle(
        color: color.whiteColor, fontSize: 50.sp, fontFamily: bold);
  }

  TextStyle get loginScreenName {
    return TextStyle(
        color: color.themeColor, fontSize: 20.sp, fontFamily: bold);
  }

  TextStyle get textFieldLabel {
    return TextStyle(
      color: color.whiteColor,
      fontSize: 10.sp,
      fontFamily: regular,
    );
  }

  TextStyle get textUnderLine {
    return TextStyle(
        color: color.whiteColor,
        fontSize: 10.sp,
        fontFamily: regular,
        decoration: TextDecoration.underline);
  }

  TextStyle get otpTextField {
    return TextStyle(
        color: color.whiteColor, fontSize: 15.sp, fontFamily: cMedium);
  }

  TextStyle get welcomeText {
    return TextStyle(
        color: color.whiteColor, fontSize: 25.sp, fontFamily: cMedium);
  }

  TextStyle get kfcText {
    return TextStyle(
        color: color.themeColor, fontSize: 25.sp, fontFamily: bold);
  }

  TextStyle get catText {
    return TextStyle(
      color: color.whiteColor,
      height: 1.75,
      fontSize: 15.sp,
      fontFamily: bold,
    );
  }

  TextStyle get loginHeader {
    return TextStyle(
      color: color.whiteColor,
      fontSize: 10.sp,
      fontFamily: bold,
    );
  }

  TextStyle get drawerloginText {
    return TextStyle(
      color: color.themeColor,
      fontSize: 10.sp,
      fontFamily: bold,
    );
  }

  TextStyle get itemDetailHead {
    return TextStyle(
      color: color.whiteColor,
      fontSize: 24.sp,
      fontFamily: bold,
    );
  }

  TextStyle get itemDetailSubHead {
    return TextStyle(
      color: color.whiteColor,
      fontSize: 14.sp,
      fontFamily: cMedium,
    );
  }

  TextStyle get itemNameTxt {
    return TextStyle(
      height: 0.8,
      color: color.blackColor,
      fontWeight: FontWeight.w900,
      fontSize: 36.sp,
      fontFamily: bold,
    );
  }

  TextStyle get reorderText {
    return TextStyle(
        color: color.whiteFontColor,
        // height: 1.75,
        fontSize: 15.sp,
        fontFamily: bold);
  }

  TextStyle get locationTxt {
    return TextStyle(
      color: color.whiteColor,
      height: 1.7,
      fontSize: 12.sp,
      fontFamily: bold,
    );
  }

  TextStyle get addressSubTitle {
    return TextStyle(
      height: 0.8,
      color: color.whiteColor.withOpacity(0.5),
      fontSize: 10.sp,
      fontFamily: bold,
    );
  }

  TextStyle get homeHead {
    return TextStyle(
      height: 0.8,
      color: color.whiteColor,
      fontSize: 14.sp,
      fontFamily: bold,
    );
  }

  TextStyle get cartHead {
    return TextStyle(
      height: 0.8,
      color: color.whiteColor,
      fontSize: 14.sp,
      fontFamily: bold,
    );
  }

  TextStyle get menuHead {
    return TextStyle(
      height: 0.8,
      color: color.whiteColor,
      fontSize: 13.sp,
      fontFamily: bold,
    );
  }

  TextStyle get menuDesc {
    return TextStyle(
      color: color.whiteColor.withOpacity(0.5),
      fontSize: 12.sp,
      fontFamily: cMedium,
    );
  }

  TextStyle get menuCustomize {
    return TextStyle(
      color: color.themeColor,
      fontSize: 12.sp,
      fontFamily: cMedium,
    );
  }

  TextStyle get viewAll {
    return TextStyle(
      height: 0.8,
      color: color.whiteColor,
      fontSize: 10.sp,
      fontFamily: cMedium,
    );
  }

  TextStyle get otpMsgTextField {
    return TextStyle(
      color: color.whiteColor,
      fontSize: 10.sp,
      fontFamily: regular,
    );
  }

  TextStyle get receiveOtp {
    return TextStyle(
      color: color.whiteColor,
      fontSize: 10.sp,
      fontFamily: medium,
    );
  }

  TextStyle get addressBarText {
    return TextStyle(
      color: color.whiteColor,
      fontSize: 9.sp,
      fontFamily: medium,
    );
  }

  TextStyle get orderBtn {
    return TextStyle(
      color: color.blackColor,
      fontSize: 8.sp,
      fontFamily: medium,
    );
  }

  TextStyle get resendOtp {
    return TextStyle(
      color: color.greyColor,
      fontSize: 8.sp,
      fontFamily: medium,
    );
  }

  TextStyle get changeNumber {
    return TextStyle(
      color: color.themeColor,
      fontSize: 10.sp,
      fontFamily: medium,
    );
  }

  TextStyle get itemQuantity {
    return TextStyle(
      fontSize: 9.sp,
      fontWeight: FontWeight.w900,
      color: color.whiteColor,
      fontFamily: medium,
    );
  }

  TextStyle get btnStyle {
    return TextStyle(
      fontSize: 9.sp,
      fontWeight: FontWeight.w900,
      color: color.whiteFontColor,
      fontFamily: medium,
    );
  }

  TextStyle get cartBtnStyle {
    return TextStyle(
      fontSize: 9.sp,
      fontWeight: FontWeight.w900,
      color: color.whiteFontColor,
      fontFamily: medium,
    );
  }

  TextStyle get addBtnStyle {
    return TextStyle(
      fontSize: 7.sp,
      fontWeight: FontWeight.w900,
      color: color.whiteFontColor,
      fontFamily: medium,
    );
  }

  TextStyle get vatInclusive {
    return TextStyle(
      fontSize: 7.sp,
      color: color.whiteFontColor,
      fontFamily: regular,
    );
  }

  TextStyle get vatInclusiveCart {
    return TextStyle(
      fontSize: 7.sp,
      color: color.whiteColor,
      fontFamily: regular,
    );
  }

  TextStyle get addItemText {
    return TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w900,
      color: color.whiteFontColor,
      fontFamily: bold,
    );
  }

  TextStyle get cartInstructionText {
    return TextStyle(
      fontSize: 10.sp,
      color: color.whiteColor.withOpacity(0.5),
      fontFamily: bold,
    );
  }

  TextStyle get storeAddress {
    return TextStyle(
      fontSize: 11.sp,
      color: color.whiteColor,
      fontFamily: bold,
    );
  }

  TextStyle get detailsCardHead {
    return TextStyle(
      color: color.whiteColor,
      fontSize: 12.sp,
      fontFamily: bold,
    );
  }

  TextStyle get appbarStyle {
    return TextStyle(
      color: color.whiteColor,
      fontFamily: bold,
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get homeStyle {
    return TextStyle(
      color: color.whiteFontColor,
      fontFamily: bold,
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get appbarStyleRed {
    return TextStyle(
      color: color.themeColor,
      fontFamily: bold,
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get cartAddMore {
    return TextStyle(
      color: color.whiteColor.withOpacity(0.5),
      fontFamily: bold,
      fontSize: 10.sp,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get cartAddMoreRed {
    return TextStyle(
      color: color.themeColor,
      fontFamily: bold,
      fontSize: 10.sp,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get dummyPhone {
    return TextStyle(
      color: color.whiteColor.withOpacity(0.5),
      fontFamily: bold,
      fontSize: 12.sp,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get cartCount {
    return TextStyle(
      color: color.whiteColor,
      fontFamily: bold,
      fontSize: 9.sp,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get menuAddBtn {
    return TextStyle(
      color: color.whiteFontColor,
      fontFamily: bold,
      fontSize: 11.sp,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get cartDetailBtn {
    return TextStyle(
      color: color.themeColor,
      fontFamily: bold,
      fontSize: 9.sp,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get instructionsHeader {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w900,
      color: color.whiteColor,
      fontFamily: bold,
    );
  }

  TextStyle get summeryText {
    return TextStyle(
      fontSize: 10.sp,
      color: color.whiteColor,
      fontFamily: medium,
    );
  }

  TextStyle get expensionTitle {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w900,
      color: color.whiteFontColor,
      fontFamily: bold,
    );
  }
}

String bold = "nationalCBold";
String medium = "nationalMedium";
String cMedium = "nationalCMedium";
String regular = "nationalRegular";
