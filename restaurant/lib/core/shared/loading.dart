import 'dart:ui';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: const CircularProgressIndicator(
          color: Color(0xffEF9F9F),
          strokeAlign: 12,
          strokeWidth: 6,
          strokeCap: StrokeCap.round,
        ),
      ),
    );
  }
}
