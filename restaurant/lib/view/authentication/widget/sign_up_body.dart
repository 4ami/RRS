import 'package:flutter/material.dart';
import 'package:restaurant/core/shared/fields_validator.dart';
import 'package:restaurant/view/authentication/widget/custom_field.dart';

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _fname = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Text(
                "Sign UP",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          CustomField(
            controller: _username,
            validator: (name) => Validators.usernameValidator(name),
            hint: "Username",
            label: "Enter Your Username",
          ),
          const SizedBox(height: 25),
          CustomField(
            controller: _fname,
            validator: (name) => Validators.usernameValidator(name),
            hint: "Full Name",
            label: "Enter Your Full Name",
          ),
          const SizedBox(height: 25),
          CustomField(
            controller: _password,
            validator: (name) => Validators.usernameValidator(name),
            hint: "************",
            label: "Enter Your Password",
            isObscure: true,
          ),
          const SizedBox(height: 25),
          CustomField(
            controller: _confpassword,
            validator: (name) => Validators.usernameValidator(name),
            hint: "************",
            label: "Re-Enter Your Password",
            isObscure: true,
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: SizedBox(
              width: 350,
              height: 60,
              child: FilledButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.redAccent.shade400;
                      }
                      return Colors.redAccent;
                    },
                  ),
                  enableFeedback: false,
                  splashFactory: NoSplash.splashFactory,
                ),
                onPressed: () {},
                child: Text(
                  "Sign Up",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
