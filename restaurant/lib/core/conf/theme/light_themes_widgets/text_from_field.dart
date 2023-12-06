import 'package:flutter/material.dart';

final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  enabledBorder: OutlineInputBorder(
    gapPadding: 15,
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(width: 1.3, color: Color(0xff002B5B)),
  ),
  focusColor: Colors.black,
  focusedBorder: OutlineInputBorder(
    gapPadding: 10,
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      width: 1.5,
      color: Color(0xff002B5B),
    ),
  ),
  errorBorder: OutlineInputBorder(
    gapPadding: 10,
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      width: 1.5,
      color: Colors.red,
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    gapPadding: 10,
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(width: 1.5, color: Colors.red),
  ),
  disabledBorder: OutlineInputBorder(
    gapPadding: 10,
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      width: 1.5,
      color: Colors.grey,
    ),
  ),
  filled: true,
  fillColor: Colors.white.withOpacity(.4),
);
