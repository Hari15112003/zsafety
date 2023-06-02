import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> signupUser(String email, String password, String name) async {
  // API endpoint for signup
  final String url = 'http://10.0.2.2:3000/register';

  // Prepare the request body
  Map<String, dynamic> body = {
    'email': email,
    'password': password,
    'name': name,
  };

  try {
    final response = await http.post(Uri.parse(url),
        body: json.encode(body), headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      // Successful signup, handle the response data
      var responseData = json.decode(response.body);
      return 'success';
    } else {
      // Signup failed, handle the error
      var error = json.decode(response.body)['error'];
      return error;
    }
  } catch (e) {
    // Handle any exceptions
    print('Error: $e');

    return e.toString();
  }
}
