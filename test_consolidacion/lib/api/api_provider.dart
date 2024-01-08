import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/breed_model.dart';



class ApiProvider {
  final String _baseUrl = 'https://dogapi.dog/api/v2/breeds';

  Future<Breed> fetchBreeds({int page = 1}) async {
    print("ejecutando peticion http");
    final response = await http.get(Uri.parse('$_baseUrl?page[number]=$page'));

    if (response.statusCode == 200) {
      print("conexion exitosa");
      final Map<String, dynamic> data = json.decode(response.body);
      return Breed.fromJson(data);
    } else {
      print('Failed to fetch breeds. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to fetch breeds');
    }
  }
}
