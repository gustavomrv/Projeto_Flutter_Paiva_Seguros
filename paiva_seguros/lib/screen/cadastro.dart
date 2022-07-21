// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CadastroScreen extends StatelessWidget {
  const CadastroScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      appBar: AppBar(title: Text("Cadastro"), backgroundColor: Colors.red,),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(    
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    SizedBox(height: 40,),
                    const Image(
                      image: NetworkImage('https://paivacorretora.com.br/wp-content/uploads/2020/09/cropped-Logo-Paiva-Corretora-2-218x75.png'),
                      width: 400,
                      height: 160,
                    ),                
                  ],
                ),
              ),
              SizedBox(height: 25),
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
                        labelText: 'Nome Completo',
                        hintText: 'Gustavo Moura Barros',
                        icon: Icon(Icons.person,color: Colors.red),
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
                        labelText: 'CPF',
                        hintText: '706.728.211-44',
                        icon: Icon(Icons.note_alt,color: Colors.red),
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
                        labelText: 'telefone',
                        hintText: '64993421057',
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
              SizedBox(height: 10),
              SizedBox(
                width: 150,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Cadastrar"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // background
                    onPrimary: Colors.white, // foreground
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(50)), 
                    textStyle: TextStyle(fontSize: 18),     
                    shadowColor: Colors.red,         
                  ),            
                ),  
              ),              
            ],
          ),
        ),
      ),
    );
  }
}