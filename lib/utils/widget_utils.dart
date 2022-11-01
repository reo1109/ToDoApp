import 'package:flutter/material.dart';

class WidgetUtils {

  static AppBar createAppBar(String title) {
    return AppBar(
      backgroundColor: Colors.lightGreen,
      title: Text(title),
      centerTitle: true,
    );
  }




}