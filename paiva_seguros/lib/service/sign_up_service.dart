import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:paiva_seguros/service/routes.dart';

class SignUpService {
  signUp(email, password) async {
    http.Response response = await http.post(
      Uri.parse(Routes().signUp()),
      body: json.encode(
        {
          "email": email,
          "password": password,
          "returnSecureToken": true,
        },
      ),
    );
    print(response.body);
  }
}
