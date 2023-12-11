import 'dart:convert';

import 'package:restaurant/data/models/new_reservation.dart';
import 'package:restaurant/data/models/reservation_detail.dart';
import 'package:restaurant/data/models/table.dart';
import 'package:restaurant/data/sources/remote/table_reservation_service.dart';
import 'package:http/http.dart' as http;

abstract class TableReservationServices {
  final String _baseURL = RestaurantTablesAPI.baseURL;
  final String _endPoint = RestaurantTablesAPI.endPoint;
  Future<List<Tables>> getTables();
  Future<String> reserveTable(NewReservation reservation);

  String get getBase => _baseURL;
  String get getEndPoint => _endPoint;
}

class GetTables extends TableReservationServices {
  @override
  Future<String> reserveTable(NewReservation reservation) async => '';
  @override
  Future<List<Tables>> getTables() async {
    final Uri getTablseURI = Uri.http(getBase, getEndPoint);
    final http.Response response = await http.get(getTablseURI);

    /// * check response state comming from back-end
    if (response.statusCode == 200) {
      /// * [fetchedData] will contain array of objects after decode it
      final List<dynamic> fetchedTables = jsonDecode(response.body);

      /// * Map all menu items comming from DB in [fetchedData]
      /// * parse that into an array of [Tables]
      List<Tables> tables =
          fetchedTables.map((e) => Tables.fromJson(e)).toList();
      return tables;
    }
    throw "Oops! \nIt seems like a \n[Connection Error!]";
  }
}

class GetReservationRepo extends TableReservationServices {
  @override
  Future<List<Tables>> getTables() async => [];

  @override
  Future<String> reserveTable(NewReservation reservation) async => '';

  Future<ReservationDetail> getReservationDetail(String id) async {
    final Uri getReservation = Uri.http(getBase, GetReservationAPI.endPoint);
    final http.Response response = await http.post(
      getReservation,
      headers: <String, String>{
        'content-type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(
        <String, dynamic>{"reservation_id": id},
      ),
    );

    /// * check response state comming from back-end
    if (response.statusCode == 200) {
      /// * [fetchedData] will contain array of objects after decode it
      final Map<String, dynamic> fetchedData = jsonDecode(response.body);
      Tables table = Tables.fromJson(fetchedData["table"]);
      NewReservation reservation = fetchedData["reservation"];

    }

    throw 'Unexpected Error!\nTry again.';
  }
}
