import 'dart:convert';
import 'package:http/http.dart' as http;

class CourseController {
  static const String baseUrl =
      'https://9af3-125-167-48-101.ngrok-free.app/api/v1';

  Future<Map<String, dynamic>> getCourseById(String id) async {
    final url = Uri.parse('$baseUrl/course/$id');
    final response = await http.get(
      url,
      headers: {
        'ngrok-skip-browser-warning': 'any',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get book category');
    }
  }

  Future<List<dynamic>> getAllCourse() async {
    final url = Uri.parse('$baseUrl/course');
    final response = await http.get(
      url,
      headers: {
        'ngrok-skip-browser-warning': 'any',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return responseData['courses'] as List<dynamic>;
    } else {
      throw Exception('Failed to get book categories');
    }
  }
}
