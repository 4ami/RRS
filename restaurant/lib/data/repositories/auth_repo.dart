import 'package:restaurant/data/models/user.dart';

/**
 * This is only for testing purposes
 *////

class AuthRepository {
  Future<void> signIn() async {
    print("try to login");
    await Future.delayed(const Duration(milliseconds: 1500));
    print("okay! waaaalaaa!");
  }
}
/**
 * This is The Real Auth Repo
 *////
abstract class AuthenticationRepository {
  Future<User> signIn(String username, String password);
  Future<User> signUp(String username, String password, String fname);
  Future<void> signOut();
}
