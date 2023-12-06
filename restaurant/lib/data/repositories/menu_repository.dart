import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant/data/models/menu.dart';
import 'package:restaurant/data/sources/remote/menu.dart';

abstract class MenuServices {
  final String _baseURL = RestaurantMenuAPI.baseURL;
  final String _endPoint = RestaurantMenuAPI.endPoint;
  Future<List<MenuItem>> getMenuItems();
  String get _getBase => _baseURL;
  String get _getEndPoint => _endPoint;
}

class GetMenuItems extends MenuServices {
  @override
  Future<List<MenuItem>> getMenuItems() async {
    final Uri getMenuURI = Uri.http(_getBase, _getEndPoint);
    final http.Response response = await http.get(getMenuURI);

    /// * check response state comming from back-end
    if (response.statusCode == 200) {
      /// * [fetchedData] will contain array of objects after decode it
      final List<dynamic> fetchedData = jsonDecode(response.body);

      /// * Map all menu items comming from DB in [fetchedData]
      /// * parse that into an array of [MenuItem]
      List<MenuItem> items =
          fetchedData.map((e) => MenuItem.fromJson(e)).toList();
      return items;
    }
    throw "Oops! \nIt seems like a \n[Connection Error!]";
  }
}
