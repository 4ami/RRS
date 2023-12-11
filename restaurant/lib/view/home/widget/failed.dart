import 'dart:ui';
import 'package:flutter/material.dart';

class ErrorPromptUser extends StatelessWidget {
  const ErrorPromptUser({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Container(
          height: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color(0xffFFF2F2),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(-2, 6),
                blurRadius: 16,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                title: Text(
                  "Reservation Fail!",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.redAccent),
                  textAlign: TextAlign.center,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 18),
                  child: Text.rich(
                    TextSpan(
                      text: "Error Message:\n",
                      children: [
                        TextSpan(
                          text: error,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.red, fontSize: 35),
                        ),
                      ],
                    ),
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}