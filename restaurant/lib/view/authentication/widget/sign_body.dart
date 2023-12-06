import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/shared/fields_validator.dart';
import 'package:restaurant/core/shared/loading.dart';
import 'package:restaurant/view/authentication/bloc/form_submission_status.dart';
import 'package:restaurant/view/authentication/bloc/sign_in/sign_in_bloc.dart';
import 'package:restaurant/view/authentication/bloc/sign_in/sign_in_event.dart';
import 'package:restaurant/view/authentication/bloc/sign_in/sign_in_state.dart';
import 'package:restaurant/view/authentication/widget/sign_up_body.dart';
import 'custom_field.dart';

class SignBody extends StatefulWidget {
  const SignBody({super.key});

  @override
  State<SignBody> createState() => _SignBodyState();
}

class _SignBodyState extends State<SignBody> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Center(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Fancy Resturant App",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.black),
                ),
                const SizedBox(height: 100),
                CustomField(
                    controller: _username,
                    validator: (name) => Validators.usernameValidator(name),
                    label: "Enter your username",
                    hint: "Username"),
                const SizedBox(height: 50),
                CustomField(
                    controller: _password,
                    validator: (pass) => Validators.passwordValidator(pass),
                    label: "Enter your password",
                    hint: "********",
                    isObscure: true),
                const SizedBox(height: 25),
                SizedBox(
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
                    onPressed: () {
                      setState(() {
                        if (_key.currentState!.validate()) {
                          //get username
                          context.read<SignInBloc>().add(SignInUsernameChange(
                              username: _username.text.trim()));

                          //get password
                          context.read<SignInBloc>().add(SignInPasswordChange(
                              password: _password.text.trim()));

                          //submit form
                          context.read<SignInBloc>().add(SignInSubmitted());
                        }
                      });
                    },
                    child: Text(
                      "Sign In",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        style: Theme.of(context).textTheme.bodySmall!),
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(40),
                            ),
                          ),
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () =>
                                  FocusManager.instance.primaryFocus?.unfocus(),
                              child: SingleChildScrollView(
                                padding: EdgeInsets.only(
                                    bottom: (MediaQuery.of(context)
                                        .viewInsets
                                        .bottom)),
                                child: SizedBox(
                                  height:
                                      (MediaQuery.of(context).size.height * .8),
                                  child: const SignUP(),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        "Create One!",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: const Color.fromARGB(255, 15, 178, 253),
                            decoration: TextDecoration.underline,
                            decorationColor:
                                const Color.fromARGB(255, 15, 178, 253),
                            decorationThickness: 2),
                      ),
                    ),
                  ],
                )
              ],
            ),

            //This is only for designing Loading animation when request submitted.
            /**
             * Writtent by -> @Dev-K0 
             */
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                return state.formStatus is SubmittedFormStatus
                    ? const Loading()
                    : const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}

class BlureCircles extends StatelessWidget {
  const BlureCircles(
      {super.key,
      required this.left,
      required this.top,
      required this.height,
      required this.width,
      required this.color});
  final double left;
  final double top;
  final double height;
  final double width;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * left,
      top: MediaQuery.of(context).size.height * top,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 7, sigmaY: 6),
          child: const SizedBox(),
        ),
      ),
    );
  }
}