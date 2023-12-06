import 'package:flutter_dotenv/flutter_dotenv.dart';

class RestaurantTablesAPI{
  static final String baseURL = '${dotenv.env["APIURL"]}:${dotenv.env["APIPORT"]}';
  static final String endPoint = dotenv.env["GETTABLESENDPOINT"] ?? '';
}