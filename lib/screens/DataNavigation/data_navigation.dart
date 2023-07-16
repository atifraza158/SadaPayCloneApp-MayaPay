import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  String value = "";

  void setValue(String newValue) {
    value = newValue;
    update();
  }
}
