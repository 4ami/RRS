import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthAPI {
  static String baseURL = '${dotenv.env["APIURL"]}:${dotenv.env["APIPORT"]}';
  static String endPoint = '${dotenv.env["APIENDPOINT"]}';
}

class AuthSignIn extends AuthAPI {
  static String signINEndPoint = "";
}
