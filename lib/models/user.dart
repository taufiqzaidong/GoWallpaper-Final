import 'package:flutter/material.dart';

class UserId {
  final String uid;

  UserId({this.uid});
}

class UserData {
  final String uid;
  ThemeData themeData = ThemeData.light();

  UserData({this.uid});

  void setThemeData(ThemeData theme) {
    themeData = theme;
  }

  ThemeData getThemeData() {
    return themeData;
  }
}
