// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:paiva_seguros/screen/login.dart';
import 'package:paiva_seguros/screen/my_drawer.dart';

class ChatCliente extends StatelessWidget {
  const ChatCliente({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      appBar: AppBar(title: Text("Chat com Gustavo Moura"), backgroundColor: Colors.red,),
      drawer: MyDrawer(),
      //endDrawer: ChatCliente(),
      body: Container(
        child: SingleChildScrollView(    
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(builder: (_) {
                    return TextField(
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        labelText: 'Mensagem',
                        hintText: 'Digite algo',
                        //errorText: store_login.isValidSenha,
                        icon: Icon(Icons.chat,color: Colors.red),
                      ),
                    );
                  }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
