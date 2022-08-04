import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:paiva_seguros/screen/chat_adm.dart';
import 'package:paiva_seguros/screen/chat_cliente.dart';
import 'package:paiva_seguros/screen/contatos_adm.dart';
import 'package:paiva_seguros/screen/drawer_cliente.dart';
import 'package:paiva_seguros/screen/home_adm.dart';
import 'package:paiva_seguros/screen/home_cliente.dart';
import 'package:paiva_seguros/screen/login.dart';
import 'package:paiva_seguros/screen/cadastro.dart';
import 'package:paiva_seguros/screen/seguro_empresarial.dart';
import 'package:paiva_seguros/screen/seguro_residencial.dart';
import 'package:paiva_seguros/store/cadastro_store.dart';
import 'package:paiva_seguros/store/chat_cliente_store.dart';
import 'package:paiva_seguros/store/login_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp f = await Firebase.initializeApp();
  
  inicializarSigleton();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/login_screen",
    routes: {
      "/login_screen": (context) => LoginScreen(),
      "/home_cliente_screen": (context) => HomeClienteScreen(),
      "/drawer_cliente": (context) => DrawerCliente(),
      "/cliente_seguro_residencial_screen": (context) => SeguroResidencialScreen(),
      "/cliente_seguro_empresarial_screen": (context) => SeguroEmpresarialScreen(),
      "/chat_cliente_screen": (context) => ChatClienteScreen(),
      "/home_adm_screen": (context) => HomeAdmScreen(),
      "/contatos_adm_screen": (context) => ContatosAdmScreen(),
      "/chat_adm_screen": (context) => ChatAdmScreen(),
    },    
  ));
  //FirebaseFirestore.instance.collection('teste').add({'teste': 'teste'});
}

void inicializarSigleton() {
  GetIt.I.registerSingleton(LoginClienteStore());
  GetIt.I.registerSingleton(CadastroClienteStore());
  GetIt.I.registerSingleton(ChatClienteStore());
}
