import 'dart:convert';

import 'package:restaurant/data/models/new_reservation.dart';
import 'package:restaurant/data/models/table.dart';
import 'package:restaurant/data/repositories/table_reservation_repository.dart';
import 'package:restaurant/data/sources/remote/table_reservation_service.dart';
import 'package:http/http.dart' as http;

class DeleteReservationRepo extends TableReservationServices {
  @override
  Future<List<Tables>> getTables() async => [];

  @override
  Future<String> reserveTable(NewReservation reservation) async => '';

  Future<String> deleteReservation(String id) async {
    final Uri deleteReservationUri =
        Uri.http(getBase, DeleteReservationAPI.endPoint);

    final http.Response response = await http.delete(
      deleteReservationUri,
      headers: <String, String>{
        'content-type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{"reservation_id": id}),
    );

    /// * check response state comming from back-end
    if (response.statusCode == 200) {
      final Map<String, dynamic> fetchedData = jsonDecode(response.body);
      final String res = fetchedData["response"];
      return res;
    }

    throw 'Unexpected Error!\nTry again.';
  }
}
