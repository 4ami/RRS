import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/data/repositories/auth_repo.dart';
import 'package:restaurant/view/authentication/bloc/sign_in/sign_in_bloc.dart';
import 'package:restaurant/view/authentication/widget/sign_body.dart';

class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(244, 255, 255, 255),
        body: BlocProvider(
          create: (context) => SignInBloc(repo: context.read<AuthRepository>()),
          child: const SignBody(),
        ),
      ),
    );
  }
}
