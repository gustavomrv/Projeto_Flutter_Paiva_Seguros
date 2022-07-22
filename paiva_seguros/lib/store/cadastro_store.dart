// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paiva_seguros/model/cliente.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:paiva_seguros/screen/login.dart';
import 'package:paiva_seguros/service/sign_up_service.dart';
part 'cadastro_store.g.dart';

class CadastroClienteStore = _CadastroClienteStoreBase with _$CadastroClienteStore;

abstract class _CadastroClienteStoreBase with Store {
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerCpf = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerTelefone = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();

  @observable
  String? nome;  
  @observable
  String? cpf;
  @observable
  String? email;
  @observable
  String? telefone;
  @observable
  String? senha;

  @action
  void setNome(String? v) {
    if (v == null) controllerNome.text = "";
    nome = v;
  }
  @action
  void setCpf(String? w) {
    if (w == null) controllerCpf.text = "";
    cpf = w;
  }
  @action
  void setEmail(String? x) {
    if (x == null) controllerEmail.text = "";
    email = x;
  }
  @action
  void setTelefone(String? y) {
    if (y == null) controllerTelefone.text = "";
    telefone = y;
  }
  @action
  void setSenha(String? z) {
    if (z == null) controllerSenha.text = "";
    senha = z;
  }

  @computed
  String? get isValidName {
    if (nome == null)
      return null;
    else if (nome!.isEmpty) {
      return "O campo não pode ser vazio ";
    } else if (nome!.length < 3)
      return "O campo acima deve conter mais de 3 caracteres";
    return null;
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
  String? get isValidEmail {
    if (email == null)
      return null;
    else if (email!.isEmpty) {
      return "O campo não pode ser vazio ";
    } else if (email!.length < 7)
      return "O campo email deve conter mais de 7 caracteres";
    return null;
  }
  @computed
  String? get isValidTelefone {
    if (telefone == null)
      return null;
    else if (telefone!.isEmpty) {
      return "O campo não pode ser vazio ";
    } else if (telefone!.length < 10)
      return "O campo telefone deve conter mais de 9 caracteres";
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

  Function()? save(context) {
    if (nome != null && isValidName == null && cpf != null && isValidCpf == null &&
        email != null && isValidEmail == null && telefone != null && isValidTelefone == null
        && senha != null && isValidSenha == null)
      return () {
        Cliente c = getDados();        
        FirebaseFirestore.instance.collection("cliente").add(c.toMap());
        setNome(null);
        setCpf(null);
        setEmail(null);
        setTelefone(null);
        setSenha(null);

        Navigator.of(context)
          .push(MaterialPageRoute(builder: (v) => LoginScreen()));
        
      };
    else
      return null;
  }

  Cliente getDados() {
    SignUpService().signUp(
      email,
      senha,
    );
    //print(email);
    return Cliente(nome: nome, cpf: cpf, email: email, telefone: telefone, senha: senha);
  }
}
