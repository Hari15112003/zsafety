import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> loginUser(String email, String password) async {
  // API endpoint for login
  final String url = 'http://10.0.2.2:3000/login';
  // Prepare the request body
  Map<String, dynamic> body = {
    'email': email,
    'password': password,
  };

  try {
    // Make a POST request to the API
    final response = await http.post(Uri.parse(url),
        body: json.encode(body), headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      return 'success';
    } else {
      var error = json.decode(response.body)['error'];
      return error;
    }
  } catch (e) {
    print('Print Error: $e');
    return e.toString();
  }
}
