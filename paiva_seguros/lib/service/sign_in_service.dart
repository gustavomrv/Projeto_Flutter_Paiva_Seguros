import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:paiva_seguros/screen/home_cliente.dart';
import 'package:paiva_seguros/screen/home_adm.dart';
import 'package:paiva_seguros/service/routes.dart';

class SignInService {
  signIn(email, password, context) async {
    http.Response response = await http.post(
      Uri.parse(Routes().signIn()),
      body: json.encode(
        {
          "email": email,
          "password": password,
          "returnSecureToken": true,
        },
      ),
      
    );
    print(response.body);
    if (response.body.contains("INVALID_PASSWORD") || response.body.contains("EMAIL_NOT_FOUND")) {
      print('Email ou senha invalido');
    } else if (response.body.contains("gustavomourago@gmail.com")) {
      Navigator.of(context)
      .push(MaterialPageRoute(builder: (v) => HomeAdmScreen()));
    } else {
      Navigator.of(context)
      .push(MaterialPageRoute(builder: (v) => HomeClienteScreen()));
    }
  }
}
