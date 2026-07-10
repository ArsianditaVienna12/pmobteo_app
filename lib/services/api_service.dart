// services/api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  // ⚠️ GANTI INI dengan IP komputer kamu!
  // Cari IP: buka CMD → ipconfig → IPv4 Address
  static const String baseUrl = 'http://192.168.56.1:8000/api'; // ← GANTI!

  // Kalau mau test di web/Chrome:
  // static const String baseUrl = 'http://127.0.0.1:8000/api';

  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    print('🔵 [LOGIN] Kirim ke: $baseUrl/login');

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      print('🟢 [LOGIN] Status: ${response.statusCode}');
      print(
          '🟢 [LOGIN] Body: ${response.body.substring(0, response.body.length > 200 ? 200 : response.body.length)}');

      // Cek kalau response bukan JSON
      if (!response.body.trim().startsWith('{')) {
        print('❌ [LOGIN] Bukan JSON! Mungkin HTML error page');
        return {
          'success': false,
          'error': 'Server error (bukan JSON). Cek Laravel server & URL.'
        };
      }

      final data = jsonDecode(response.body);

      if (data['success'] == true) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', data['data']['token']);
      }

      return data;
    } catch (e) {
      print('❌ [LOGIN] Exception: $e');
      return {'success': false, 'error': 'Gagal connect ke server: $e'};
    }
  }

  static Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String address,
  }) async {
    print('🔵 [REGISTER] Kirim ke: $baseUrl/register');

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
          'address': address,
        }),
      );

      print('🟢 [REGISTER] Status: ${response.statusCode}');
      print(
          '🟢 [REGISTER] Body: ${response.body.substring(0, response.body.length > 200 ? 200 : response.body.length)}');

      if (!response.body.trim().startsWith('{')) {
        return {'success': false, 'error': 'Server error (bukan JSON)'};
      }

      return jsonDecode(response.body);
    } catch (e) {
      print('❌ [REGISTER] Exception: $e');
      return {'success': false, 'error': 'Gagal connect: $e'};
    }
  }

  static Future<List<dynamic>> getPets() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await http.get(
        Uri.parse('$baseUrl/pets'),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
      );

      if (!response.body.trim().startsWith('{')) {
        print('❌ [PETS] Bukan JSON: ${response.body.substring(0, 100)}');
        return [];
      }

      final data = jsonDecode(response.body);
      return data['data'] ?? [];
    } catch (e) {
      print('❌ [PETS] Error: $e');
      return [];
    }
  }

  static Future<Map<String, dynamic>> getProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await http.get(
        Uri.parse('$baseUrl/user'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
      );

      print('🟢 [PROFILE] Status: ${response.statusCode}');
      print('🟢 [PROFILE] Body: ${response.body}');

      if (!response.body.trim().startsWith('{')) {
        return {'success': false, 'error': 'Server error (bukan JSON)'};
      }

      return jsonDecode(response.body);
    } catch (e) {
      print('❌ [PROFILE] Exception: $e');
      return {'success': false, 'error': 'Gagal connect: $e'};
    }
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}
