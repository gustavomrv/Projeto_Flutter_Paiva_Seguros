import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:paiva_seguros/screen/login.dart';
import 'package:paiva_seguros/screen/cadastro.dart';
import 'package:paiva_seguros/store/cadastro_store.dart';
import 'package:paiva_seguros/store/login_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp f = await Firebase.initializeApp();

  
  inicializarSigleton();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),
  ));
  //FirebaseFirestore.instance.collection('teste').add({'teste': 'teste'});
}

void inicializarSigleton() {
  GetIt.I.registerSingleton(LoginClienteStore());
  GetIt.I.registerSingleton(CadastroClienteStore());
}
