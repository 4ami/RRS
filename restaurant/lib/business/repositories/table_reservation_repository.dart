import 'dart:convert';
import 'package:restaurant/data/models/new_reservation.dart';
import 'package:restaurant/data/models/table.dart';
import 'package:restaurant/data/repositories/table_reservation_repository.dart';
import 'package:restaurant/data/sources/remote/table_reservation_service.dart';
import 'package:http/http.dart' as http;

class CreateReservation extends TableReservationServices {
  @override
  Future<List<Tables>> getTables() async => [];

  @override
  Future<String> reserveTable(NewReservation reservation) async {
    final Uri createReservationUri =
        Uri.http(super.getBase, ReserveTableAPI.endPoint);
    final http.Response response = await http.post(createReservationUri,
        body: jsonEncode(
          <String, dynamic>{
            "customer_phone": reservation.customerPhone,
            "table_id": reservation.tableId,
            "reservation_date": reservation.reservationDate,
            "party_size": reservation.parySize
          },
        ),
        headers: <String, String>{
          'content-type': 'application/json; charset=UTF-8'
        });

    /// * check response state comming from back-end
    if (response.statusCode == 201) {
      /// * [fetchedData] will contain array of objects after decode it
      final fetchedData = jsonDecode(response.body) as Map<String, dynamic>;
      // return fetchedData["reservation_number"].toString();
      return "${fetchedData['reservation_number']}";
    }
    throw "Unexpected Error!\nTry again.";
  }
}
