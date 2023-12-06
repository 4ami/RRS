import 'dart:convert';

import 'package:restaurant/data/models/table.dart';
import 'package:restaurant/data/sources/remote/table_reservation_service.dart';
import 'package:http/http.dart' as http;

abstract class TableReservationServices {
  final String _baseURL = RestaurantTablesAPI.baseURL;
  final String _endPoint = RestaurantTablesAPI.endPoint;
  Future<List<Tables>> getTables();
  Future<String> reserveTable();

  String get _getBase => _baseURL;
  String get _getEndPoint => _endPoint;
}

class GetTables extends TableReservationServices {
  @override
  Future<String> reserveTable() async => '';
  @override
  Future<List<Tables>> getTables() async {
    final Uri getTablseURI = Uri.http(_getBase, _getEndPoint);
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
