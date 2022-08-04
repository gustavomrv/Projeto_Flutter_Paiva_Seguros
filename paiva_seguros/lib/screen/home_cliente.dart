// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:paiva_seguros/screen/chat_cliente.dart';
import 'package:paiva_seguros/screen/drawer_cliente.dart';

class HomeClienteScreen extends StatelessWidget {

  HomeClienteScreen({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {

    dynamic data = ModalRoute.of(context)?.settings.arguments;
    String email = data["email"];

    return Scaffold(     
      appBar: AppBar(title: Text('Página Inicial'), backgroundColor: Colors.red,),    
      drawer: DrawerCliente(),
      body: Container(
          child: Column(
            children: [              
              Container(
                height: 245,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 5,),
                    Text('Seguro Residencial', style: TextStyle(fontSize: 22, color: Colors.red)),
                    SizedBox(height: 5,),
                    Image(
                      image: NetworkImage('https://paivacorretora.com.br/wp-content/uploads/2020/06/baner-blog-insurance-desenho-casa-familia-2.png'),
                      width: double.infinity,
                      height: 170,
                    ),    
                    SizedBox(height: 5,),                    
                    SizedBox(
                      width: 140,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {       
                          Navigator.pushReplacementNamed(
                            context,
                            "/cliente_seguro_residencial_screen",
                            arguments: {"email": email}
                          );             
                        },
                        child: Text("Saiba mais"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // background
                          onPrimary: Colors.white, // foreground
                          textStyle: TextStyle(fontSize: 18),     
                          shadowColor: Colors.red,         
                        ),            
                      ),  
                    ),            
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 245,
                width: double.infinity,
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 5,),
                    Text('Seguro Empresarial', style: TextStyle(fontSize: 22, color: Colors.white)),
                    SizedBox(height: 5,),
                    Image(
                      image: NetworkImage('https://paivacorretora.com.br/wp-content/uploads/2020/09/WhatsApp-Image-2020-09-04-at-14.55.12.jpeg'),
                      width: double.infinity,
                      height: 170,
                    ),    
                    SizedBox(height: 5,),                    
                    SizedBox(
                      width: 140,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () { 
                          Navigator.pushReplacementNamed(
                            context,
                            "/cliente_seguro_empresarial_screen",
                            arguments: {"email": email}
                          );               
                        },
                        child: Text("Saiba mais"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white, // background
                          onPrimary: Colors.red, // foreground
                          textStyle: TextStyle(fontSize: 18),     
                          shadowColor: Colors.red,         
                        ),            
                      ),  
                    ),            
                  ],
                ),
              ),
              SizedBox(height: 10, child: Container(color: Colors.red),),
              SizedBox(height: 5, child: Container(color: Colors.white),),
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