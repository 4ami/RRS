import 'package:flutter_dotenv/flutter_dotenv.dart';

class RestaurantTablesAPI {
  static final String baseURL =
      '${dotenv.env["APIURL"]}:${dotenv.env["APIPORT"]}';
  static final String endPoint = dotenv.env["GETTABLESENDPOINT"] ?? '';
}

class ReserveTableAPI {
  static final String endPoint =
      '${dotenv.env["RESERVETABLEBASEENDPOINT"]}${dotenv.env["RESERVETABLEENDPOINT"]}';
}

class GetReservationAPI {
  static final String endPoint = '${dotenv.env["RESERVETABLEBASEENDPOINT"]}${dotenv.env["GETRESERVATIONENDPOINT"]}';
}
class DeleteReservationAPI {
  static final String endPoint = '${dotenv.env["RESERVETABLEBASEENDPOINT"]}${dotenv.env["DELETERESERVATIONENDPOINT"]}';
}
class UpdateReservationAPI {
  static final String endPoint = '${dotenv.env["RESERVETABLEBASEENDPOINT"]}${dotenv.env["UPDATERESERVATIONENDPOINT"]}';
}
