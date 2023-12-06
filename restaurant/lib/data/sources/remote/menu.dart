import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class RestaurantMenuAPI {
  static final String baseURL = '${dotenv.env["APIURL"]}:${dotenv.env["APIPORT"]}';
  static final String endPoint = dotenv.env["GETMENUITEMSENDPOINT"] ?? '';
}
