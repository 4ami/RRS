import 'dart:ui';
import 'package:flutter/material.dart';

class SuccessPromptUser extends StatelessWidget {
  const SuccessPromptUser({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Container(
          width: 350,
          height: 400,
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
            children: [
              ListTile(
                title: Text(
                  "Reservation Success!",
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 18),
                  child: Text.rich(
                    TextSpan(
                      text: "Your Reservation Code: ",
                      children: [
                        TextSpan(
                          text: id,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Please check your reservation state through manage reservation section.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}