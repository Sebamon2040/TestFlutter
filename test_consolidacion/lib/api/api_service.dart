import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:test_consolidacion/models/pagos_model.dart';


class ApiService {
//Connection to API
  Future<dynamic> fetchPagos({int page = 1}) async {
    final String _baseUrl = "http://127.0.0.1:8000/api/conciliacion/pagos2/";

    print("current page: $page");
    print("API request to : ${_baseUrl}?page=$page");
    final response = await http.get(Uri.parse("$_baseUrl?page=$page"));

    if (response.statusCode == 200) {
      // If the server returns an OK response, we parse the JSON.
      print("Success");
      final Map<String, dynamic> data = jsonDecode(response.body);

      Pagos pagos = Pagos.fromJson(data);
      
      return pagos;
    } else {
      // If the response is not OK, we throw an error.
      throw Exception('Failed to load pagos');
    }
  }

}