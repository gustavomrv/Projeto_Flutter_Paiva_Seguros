// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:paiva_seguros/store/cadastro_store.dart';
//import 'package:get_it/get_it_impl.dart';

class CadastroScreen extends StatelessWidget {
  CadastroScreen({ Key? key }) : super(key: key);
  var store = GetIt.I<CadastroClienteStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      appBar: AppBar(title: Text("Cadastro"), backgroundColor: Colors.red,),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(    
          child: Column(
            children: [
              Container(
                height: 140,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    SizedBox(height: 20),
                    const Image(
                      image: NetworkImage('https://paivacorretora.com.br/wp-content/uploads/2020/09/cropped-Logo-Paiva-Corretora-2-218x75.png'),
                      width: 400,
                      height: 120,
                    ),                
                  ],
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(builder: (_) {
                    return TextField(
                      controller: store.controllerNome,
                      onChanged: (value) {
                        store.setNome(value);
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
                        labelText: 'Nome Completo',
                        hintText: 'Gustavo Moura Barros',
                        errorText: store.isValidName,
                        icon: Icon(Icons.person,color: Colors.red),
                      ),
                    );
                  }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(builder: (_) {
                    return TextField(
                      controller: store.controllerCpf,
                      onChanged: (value) {
                        store.setCpf(value);
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
                        labelText: 'CPF',
                        hintText: '706.728.211-44',
                        errorText: store.isValidCpf,
                        icon: Icon(Icons.note_alt,color: Colors.red),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CpfInputFormatter(),
                      ],
                    );
                  }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(builder: (_) {
                    return TextField(
                      controller: store.controllerEmail,
                      onChanged: (value) {
                        store.setEmail(value);
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
                        errorText: store.isValidEmail,
                        icon: Icon(Icons.email_outlined,color: Colors.red),
                      ),
                    );
                  }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(builder: (_) {
                    return TextField(
                      controller: store.controllerTelefone,
                      onChanged: (value) {
                        store.setTelefone(value);
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
                        labelText: 'Telefone',
                        hintText: '(64)99342-1057',
                        errorText: store.isValidTelefone,
                        icon: Icon(Icons.send_to_mobile_outlined,color: Colors.red),                        
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter(),
                      ],
                    );
                  }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(builder: (_) {
                    return TextField(
                      enableSuggestions: false,
                      autocorrect: false,
                      obscureText: true,
                      controller: store.controllerSenha,
                      onChanged: (value) {
                        store.setSenha(value);
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
                        errorText: store.isValidSenha,                        
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
                  onPressed: store.save(context),
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
              SizedBox(height: 150, child: Scaffold(backgroundColor: Colors.white,)),   
              SizedBox(height: 50, child: Scaffold(backgroundColor: Colors.red,)),            
            ],
          ),
        ),
      ),

    );
  }
}