import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:paiva_seguros/model/cliente.dart';
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
    //print(email_user);
    //print(response.body);
    if (response.body.contains("INVALID_PASSWORD") || response.body.contains("EMAIL_NOT_FOUND")) {
      print('Email ou senha invalido');
    } else if (response.body.contains("gustavomourago@gmail.com")) {
      Navigator.of(context)
      .push(MaterialPageRoute(builder: (v) => HomeAdmScreen()));
    } else { 
      // dynamic nome = load(email);
      // print('Função else $nome');
      Navigator.pushReplacementNamed(
          context,
          "/home_cliente_screen",
          arguments: {"email": email}
      );
    }
  }
}

// dynamic load(email) {
//   var nome_map = FirebaseFirestore.instance.collection("cliente").where('email', isEqualTo: email);
//   dynamic nome = '';
//   StreamBuilder<QuerySnapshot>(
//     stream: nome_map.snapshots(),
//     builder: (context, snap) {
//       if (snap.hasData) {
//         List<DocumentSnapshot> documents = snap.data!.docs;
//         documents.map(
//           (e) => nome = e['nome'],
//         ).toList();
//       }
//       print('Função load $nome');
//       return nome;
//     }
//   );
//   return nome;
// }