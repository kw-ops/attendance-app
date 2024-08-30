import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl =
      "http://attendacesystem.pythonanywhere.com/api/"; // Replace with your API base URL

  Future<Map<String, dynamic>> login(
      String username, String password, String staffId) async {
    final url = Uri.parse('${_baseUrl}api/login/staff/');
    print(username + password + staffId);
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        "accept": "application/json",
        // "Authorization": "Token b36a82b514163b6d2e3a55468878af38df5721fd"
      },
      body: jsonEncode({
        "username": username,
        "password": password,
        "staff_id": staffId,
      }),
    );
    try {
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
    }
    throw Exception('Failed to login: ${response.statusCode}');
    // Assuming the response body is a JSON object
    // } else {
    //   throw Exception('Failed to login: ${response.statusCode}');
    // }
  }
}
