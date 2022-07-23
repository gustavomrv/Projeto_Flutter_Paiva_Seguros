// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:paiva_seguros/screen/cadastro.dart';
import 'package:paiva_seguros/store/login_store.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({ Key? key }) : super(key: key);
  var store_login = GetIt.I<LoginClienteStore>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
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
                      controller: store_login.controllerEmail,
                      onChanged: (value) {
                        store_login.setEmail(value);
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
                        labelText: 'Email',
                        hintText: 'gustavomourago@gmail.com',
                        errorText: store_login.isValidEmail,
                        icon: Icon(Icons.email_outlined,color: Colors.red),
                      ),
                    );
                  }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(builder: (_) {
                    return TextField(
                      controller: store_login.controllerSenha,
                      onChanged: (value) {
                        store_login.setSenha(value);
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
                        labelText: 'Senha',
                        hintText: '********',
                        errorText: store_login.isValidSenha,
                        icon: Icon(Icons.lock,color: Colors.red),
                      ),
                    );
                  }),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 150,
                height: 45,
                child: ElevatedButton(
                  onPressed: store_login.login(context),
                  child: Text("Entrar"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // background
                    onPrimary: Colors.white, // foreground
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(50)), 
                    textStyle: TextStyle(fontSize: 18),     
                    shadowColor: Colors.red,         
                  ),            
                ),  
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 150,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (v) => CadastroScreen()));
                  },
                  child: Text("Cadastrar-se"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, // background
                    onPrimary: Colors.red, // foreground
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(50)), 
                    textStyle: TextStyle(fontSize: 18),     
                    shadowColor: Colors.red,         
                  ),            
                ),  
              ),
              SizedBox(height: 10),
              SizedBox(height: 90, child: Scaffold(backgroundColor: Colors.white,)),   
              SizedBox(height: 50, child: Scaffold(backgroundColor: Colors.red,)),   
            ],
          ),
        ),
      ),
    );
  }
}