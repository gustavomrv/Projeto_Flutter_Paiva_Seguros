// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paiva_seguros/model/cliente.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginClienteStore = _LoginClienteStoreBase with _$LoginClienteStore;

abstract class _LoginClienteStoreBase with Store {
  TextEditingController controllerCpf = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();
 
  @observable
  String? cpf;
  @observable
  String? senha;

  @action
  void setCpf(String? w) {
    if (w == null) controllerCpf.text = "";
    cpf = w;
  }
  @action
  void setSenha(String? z) {
    if (z == null) controllerSenha.text = "";
    senha = z;
  }

  @computed
  String? get isValidCpf {
    if (cpf == null)
      return null;
    else if (cpf!.isEmpty) {
      return "O campo não pode ser vazio ";
    } else if (cpf!.length < 11) {
      return "O campo CPF deve conter exatamente 11 dígitos";
    } else if (cpf!.length > 11) {
      return "O campo CPF deve conter exatamente 11 dígitos";
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

  Cliente getDados() {
    return Cliente(cpf: cpf, senha: senha);
  }

  Function()? login(context) {
    if (cpf != null && isValidCpf == null && senha != null && isValidSenha == null)
      return () {
        //setCpf(null);
        //setSenha(null);
        
      };
    else
      return null;
  }
}
