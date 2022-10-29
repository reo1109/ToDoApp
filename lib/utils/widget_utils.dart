import 'package:flutter/material.dart';

class WidgetUtils {

  static AppBar createAppBar(String title) {
    return AppBar(
      backgroundColor: Colors.green,
      title: Text(title),
      centerTitle: true,
    );
  }




}