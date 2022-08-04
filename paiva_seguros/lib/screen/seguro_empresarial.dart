// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:paiva_seguros/screen/chat_cliente.dart';
import 'package:paiva_seguros/screen/drawer_cliente.dart';

class SeguroEmpresarialScreen extends StatelessWidget {

  SeguroEmpresarialScreen({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {

    dynamic data = ModalRoute.of(context)?.settings.arguments;
    String email = data["email"];

    return Scaffold(     
      appBar: AppBar(title: Text('Seguro Empresarial'), backgroundColor: Colors.red,),    
      drawer: DrawerCliente(),
      //endDrawer: ChatCliente(),
      body: Container(
          child: Column(
            children: [              
              Container(
                height: 345,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 5,),
                    Image(
                      image: NetworkImage('https://paivacorretora.com.br/wp-content/uploads/2020/09/mDa3qo9ij9-150x150.jpg'),
                      width: double.infinity,
                      height: 170,
                    ),    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Você foca no seu negócio e o seguro cuida da proteção da sua empresa!', style: TextStyle(fontSize: 18, color: Colors.red)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Seja qual for o ramo de atuação ou tamanho da sua empresa, há coberturas sob medida para suas necessidades. Além da estrutura física, o seguro protege o equilíbrio fincanceiro em casos de sinistros, ações judiciais e possui assistências 24 horas que facilitam sua rotina.', style: TextStyle(fontSize: 14, color: Colors.black)),
                    ),               
                  ],
                ),
              ),            
              Container(
                height: 134,
                width: double.infinity,
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [                    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Coberturas', style: TextStyle(fontSize: 19, color: Colors.white)),
                    ),    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Incêndio, raio, explosão, quebra de vidros, fidelidade de empregados, perda de aluguel, contaminação e deterioração de mercadorias, danos elétricos, subtração de valores, lucros cessantes, danos morais, tumultos, despesas fixas, painéis, letreiros, vendavais.', style: TextStyle(fontSize: 14, color: Colors.white)),
                    ),                                       
                  ],
                ),
              ),  
              SizedBox(height: 5,),        
              SizedBox(
                      width: 240,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {       
                          Navigator.pushReplacementNamed(
                              context,
                              "/chat_cliente_screen",
                              arguments: {"email": email}
                            );        
                        },
                        child: Text("Converse com o corretor"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // background
                          onPrimary: Colors.white, // foreground
                          textStyle: TextStyle(fontSize: 18),     
                          shadowColor: Colors.red,         
                        ),            
                      ),  
                    ),  
              SizedBox(height: 5,),       
              Container(
                height: 110,
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
            ],
          ),

      ),
    );    
  }
}