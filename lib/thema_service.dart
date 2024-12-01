import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeService {
  final Rx<ThemeMode> _theme = ThemeMode.light.obs;

  ThemeMode get theme => _theme.value;

  void switchTheme() {
    if (_theme.value == ThemeMode.light) {
      _theme.value = ThemeMode.dark;
    } else {
      _theme.value = ThemeMode.light;
    }
  }
}
