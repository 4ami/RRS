import 'package:flutter/material.dart';
import 'package:restaurant/core/conf/theme/light_themes_widgets/app_bar_theme.dart';
import 'package:restaurant/core/conf/theme/light_themes_widgets/body_small.dart';
import 'package:restaurant/core/conf/theme/light_themes_widgets/headline_small.dart';
import 'package:restaurant/core/conf/theme/light_themes_widgets/text_from_field.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Exo',
    textTheme: const TextTheme(
      bodySmall: bodySmall,
      headlineSmall: headlineSmall,
    ),
    inputDecorationTheme: inputDecorationTheme,
    appBarTheme: appBarTheme,
  );
}
