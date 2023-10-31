import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> fetchBurgers() async {
  final response = await http.get(
    Uri.parse('https://burgers-hub.p.rapidapi.com/burgers'),
    headers: {
      'X-RapidAPI-Host': 'burgers-hub.p.rapidapi.com',
      'X-RapidAPI-Key': 'd5eaf7276fmshd3d34c051ae7608p18e432jsna11b3af7f3d0',
    },
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load burgers');
  }
}
