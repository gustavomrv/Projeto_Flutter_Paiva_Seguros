// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:paiva_seguros/screen/chat_cliente.dart';
import 'package:paiva_seguros/screen/my_drawer.dart';

class HomeClienteScreen extends StatelessWidget {

  HomeClienteScreen({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {

    dynamic data = ModalRoute.of(context)?.settings.arguments;
    String email = data["email"];
    // String nome = data["nome"];
    // print(nome);
    return Scaffold(     
      appBar: AppBar(title: Text('Bem vindo(a)'), backgroundColor: Colors.red,),    
      drawer: MyDrawer(),
      //endDrawer: ChatCliente(),
      body: Container(
        child: SingleChildScrollView(    
          child: Column(
            children: [              
              Container(
                height: 300,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30,),
                    const Image(
                      image: NetworkImage('https://paivacorretora.com.br/wp-content/uploads/2020/09/cropped-Logo-Paiva-Corretora-2-218x75.png'),
                      width: 400,
                      height: 150,
                    ),                
                  ],
                ),
              ),
              SizedBox(height: 210, child: Container(color: Colors.white,)),
              Container(
                height: 120,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 70,
                        height: 70,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              "/chat_cliente_screen",
                              arguments: {"email": email}
                            );
                          },
                          child: Icon(Icons.chat,color: Colors.white),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red, // background
                            onPrimary: Colors.white, // foreground
                            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(50)),      
                            shadowColor: Colors.red,         
                          ),            
                        ),  
                      ),             
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50, child: Container(color: Colors.red,)),
            ],
          ),
        ),
      ),
    );
    
  }
}