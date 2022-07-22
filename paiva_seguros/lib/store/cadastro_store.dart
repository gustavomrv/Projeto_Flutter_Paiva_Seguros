// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paiva_seguros/model/cliente.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'cadastro_store.g.dart';

class CadastroClienteStore = _CadastroClienteStoreBase with _$CadastroClienteStore;

abstract class _CadastroClienteStoreBase with Store {
  TextEditingController controllerNome = TextEditingController();

  @observable
  String? nome;  

  @action
  void setNome(String? v) {
    if (v == null) controllerNome.text = "";
    nome = v;
  }

  @computed
  String? get isValidName {
    if (nome == null)
      return null;
    else if (nome!.isEmpty) {
      return "O campo não pode ser vazio ";
    } else if (nome!.length < 3)
      return "O campo nome deve contem mais de 3 caracteres";
    return null;
  }

  Function()? save() {
    if (nome != null && isValidName == null)
      return () {
        Cliente c = getDados();
        FirebaseFirestore.instance.collection("cliente").add(c.toMap());
        setNome(null);
      };
    else
      return null;
  }

  Cliente getDados() {
    return Cliente(nome: nome);
  }
}
