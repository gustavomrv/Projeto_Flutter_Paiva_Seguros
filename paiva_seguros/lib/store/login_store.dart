// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paiva_seguros/model/cliente.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../service/sign_in_service.dart';
part 'login_store.g.dart';

class LoginClienteStore = _LoginClienteStoreBase with _$LoginClienteStore;

abstract class _LoginClienteStoreBase with Store {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();
 
  @observable
  String? email;
  @observable
  String? senha;

  @action
  void setEmail(String? w) {
    if (w == null) controllerEmail.text = "";
    email = w;
  }
  @action
  void setSenha(String? z) {
    if (z == null) controllerSenha.text = "";
    senha = z;
  }

  @computed
  String? get isValidEmail {
    if (email == null)
      return null;
    else if (email!.isEmpty) {
      return "O campo não pode ser vazio ";
    }
    else if (!email!.contains("@")) {
      return "Está faltando um @ no email";
    } 
    else if (!email!.contains(".")) {
      return "Está faltando um . no email";
    }   
    else if (email!.length < 7) {
      return "O campo email deve conter ao menos 7 dígitos";
    }
    return null;
  }
  @computed
  String? get isValidSenha {
    if (senha == null)
      return null;
    else if (senha!.isEmpty) {
      return "O campo não pode ser vazio ";
    } else if (senha!.length < 6)
      return "A senha deve conter mais de 5 caracteres";
    return null;
  }

  Function()? login(context) {
    if (email != null && isValidEmail == null && senha != null && isValidSenha == null) 
    return () {
      SignInService().signIn(
        email,
        senha,
        context,
      );    
      setEmail(null);
      setSenha(null);
    };
    else
      return null;
  }
}
