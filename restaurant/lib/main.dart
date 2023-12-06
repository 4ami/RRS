import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:restaurant/core/conf/router.dart';
import 'package:restaurant/core/conf/theme/app_theme.dart';
void main() async {
  try {
    await _loadDotEnv();
    runApp(const StartPoint());
  } catch (error) {
    debugPrint("DotEnv fail to load:\n");
    debugPrint(error.toString());
  }
}

class StartPoint extends StatelessWidget {
  const StartPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}

_loadDotEnv() async {
  await dotenv.load(fileName: '.env.development');
}
