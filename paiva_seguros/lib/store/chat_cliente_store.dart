// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paiva_seguros/model/cliente.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:paiva_seguros/model/mensagem.dart';
import 'package:paiva_seguros/screen/login.dart';
import 'package:paiva_seguros/service/sign_up_service.dart';
part 'chat_cliente_store.g.dart';

class ChatClienteStore = _ChatClienteStoreBase with _$ChatClienteStore;

abstract class _ChatClienteStoreBase with Store {
  TextEditingController controllerTexto = TextEditingController();

  @observable
  String? texto;  

  @action
  void setTexto(String? t) {
    if (t == null) controllerTexto.text = "";
    texto = t;
  }

  @computed
  String? get isValidTexto {
    if (texto == null)
      return null;
    else if (texto!.isEmpty) {
      return "A mensagem não pode ser vazia";
    } else if (texto!.length < 2)
      return "A mensagem deve conter ao menos 2 caracteres";
    return null;
  }

  Function()? save(context) {
    if (texto != null && isValidTexto == null)
      return () {
        Mensagem m = getDados();        
        //FirebaseFirestore.instance.collection("mensagem").add(m.toMap());
        setTexto(null);        
      };
    else
      return null;
  }

  Mensagem getDados() {
    return Mensagem(texto: texto, tempo: DateTime.now(), remetente: FirebaseAuth.instance.currentUser?.email, destinatario: "gustavomourago@gmail.com");
  }

  
 

}
