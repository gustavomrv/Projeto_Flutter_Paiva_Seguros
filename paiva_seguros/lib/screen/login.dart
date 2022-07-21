// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginScreen 

extends StatelessWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                SizedBox(height: 150,),
                const Image(
                  image: NetworkImage('https://paivacorretora.com.br/wp-content/uploads/2020/09/cropped-Logo-Paiva-Corretora-2-218x75.png'),
                  width: 400,
                  height: 150,
                ),                
              ],
            ),
          ),
          SizedBox(height: 50),
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
                    labelText: 'email',
                    hintText: 'gustavomourago@gmail.com',
                    icon: Icon(Icons.email_outlined,color: Colors.red),
                  ),
                );
              }),
          ),
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
                    labelText: 'senha',
                    hintText: '********',
                    icon: Icon(Icons.lock,color: Colors.red),
                  ),
                );
              }),
          ),
        ],
      ),
    );
  }
}