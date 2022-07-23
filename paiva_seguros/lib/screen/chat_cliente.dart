// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:paiva_seguros/screen/login.dart';
import 'package:paiva_seguros/screen/my_drawer.dart';
import 'package:paiva_seguros/store/chat_cliente_store.dart';

class ChatCliente extends StatelessWidget {
  ChatCliente({Key? key}) : super(key: key);
  var store_chat = GetIt.I<ChatClienteStore>();
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
              SizedBox(height: 540,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(builder: (_) {
                    return TextField(
                      controller: store_chat.controllerTexto,
                      onChanged: (value) {
                        store_chat.setTexto(value);
                      },
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
                        hintText: 'Digite sua mensagem',
                        errorText: store_chat.isValidTexto,
                        suffixIcon: IconButton(
                          onPressed: store_chat.save(context),
                          icon: Icon(Icons.send,color: Colors.red),
                        ),
                      ),
                    );
                  }),
              ),
              SizedBox(height: 50, child: Scaffold(backgroundColor: Colors.red,)), 
            ],
          ),
        ),
      ),
    );
  }
}
