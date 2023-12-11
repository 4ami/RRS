import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant/data/models/new_reservation.dart';
import 'package:restaurant/data/models/table.dart';
import 'package:restaurant/data/repositories/table_reservation_repository.dart';
import 'package:restaurant/data/sources/remote/table_reservation_service.dart';

class UpdateReservationRepo extends TableReservationServices {
  @override
  Future<List<Tables>> getTables() async => [];

  @override
  Future<String> reserveTable(NewReservation reservation) async => '';

  Future<void> updateReservation(
      String id, String phone, String dateTime, int partySize) async {
    final Uri updateUri = Uri.http(getBase, UpdateReservationAPI.endPoint);

    final http.Response response = await http.put(
      updateUri,
      headers: <String, String>{
        'content-type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        "reservation_id": id,
        "customer_phone": phone,
        "reservation_date": dateTime,
        "party_size": partySize,
      }),
    );

    /// * check response state comming from back-end
    if (response.statusCode != 200) {
      throw 'Unexpected Error!\nTry again.';
    }
  }
}
