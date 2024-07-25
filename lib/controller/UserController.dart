import 'dart:convert';
import 'package:http/http.dart' as http;

class UserController {
  static const String baseUrl =
      'https://4922-125-167-48-101.ngrok-free.app/api/v1';

// Fungsi untuk melakukan permintaan HTTP POST
  Future<Map<String, dynamic>> createUser(
      String username, String email, String password) async {
    final url = Uri.parse('$baseUrl/user/register');
    final body = jsonEncode({
      'username': username,
      'email': email,
      'password': password,
    });

    final response = await http.post(url, body: body, headers: {
      'ngrok-skip-browser-warning': 'any',
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create user');
    }
  }

// Fungsi untuk melakukan permintaan HTTP POST untuk login
  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    final url = Uri.parse('$baseUrl/user/login');
    final body = jsonEncode({
      'email': email,
      'password': password,
    });

    final response = await http.post(url, body: body, headers: {
      'ngrok-skip-browser-warning': 'any',
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

// Fungsi untuk melakukan permintaan HTTP GET untuk mendapatkan semua pengguna
  Future<List<dynamic>> getAllUsers() async {
    final url = Uri.parse('$baseUrl/user/users');

    final response = await http.get(
      url,
      headers: {
        'ngrok-skip-browser-warning': 'any',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['users'];
    } else {
      throw Exception('Failed to load users');
    }
  }

// Fungsi untuk melakukan permintaan HTTP GET untuk mendapatkan pengguna berdasarkan ID
  Future<Map<String, dynamic>> getUserById(String id) async {
    final url = Uri.parse('$baseUrl/user/users/$id');

    final response = await http.get(
      url,
      headers: {
        'ngrok-skip-browser-warning': 'any',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load user');
    }
  }

// Fungsi untuk melakukan permintaan HTTP PUT untuk mengupdate pengguna berdasarkan ID
  Future<Map<String, dynamic>> updateUser(String id, String username) async {
    final url = Uri.parse('$baseUrl/user/users/$id');
    final body = jsonEncode({
      'username': username,
    });

    final response = await http.put(url, body: body, headers: {
      'ngrok-skip-browser-warning': 'any',
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to update user');
    }
  }

// Fungsi untuk melakukan permintaan HTTP DELETE untuk menghapus pengguna berdasarkan ID
  Future<void> deleteUser(String id) async {
    final url = Uri.parse('$baseUrl/user/users/$id');

    final response = await http.delete(url, headers: {
      'ngrok-skip-browser-warning': 'any',
      'Accept': 'application/json',
    });

    if (response.statusCode != 200) {
      throw Exception('Failed to delete user');
    }
  }

// Fungsi untuk melakukan permintaan HTTP POST untuk verify akun pengguna
  Future<Map<String, dynamic>> verifyUser(String email, String token) async {
    final url = Uri.parse('$baseUrl/user/verify-otp');
    final body = jsonEncode({
      'email': email,
      'auth_code': token,
    });

    final response = await http.post(url, body: body, headers: {
      'ngrok-skip-browser-warning': 'any',
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to verify user');
    }
  }
}
