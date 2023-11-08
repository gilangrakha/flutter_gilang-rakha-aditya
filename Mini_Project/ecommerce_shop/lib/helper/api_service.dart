import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static List<Map<String, dynamic>> foodData = [];

  static Future<void> fetchFoodData() async {
    final response = await http.get(
      Uri.parse('https://burgers-hub.p.rapidapi.com/burgers'),
      headers: {
        'X-RapidAPI-Key': 'd5eaf7276fmshd3d34c051ae7608p18e432jsna11b3af7f3d0',
        'X-RapidAPI-Host': 'burgers-hub.p.rapidapi.com',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      foodData = data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load food data');
    }
  }
}
