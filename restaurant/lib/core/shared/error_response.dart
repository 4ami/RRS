import 'package:flutter/material.dart';
import 'package:restaurant/core/shared/constants.dart';

class ErrorResponse extends StatelessWidget {
  const ErrorResponse({
    super.key,
    required this.message
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage(errorIllustration),
            height: 250,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              "$message 😭.",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}