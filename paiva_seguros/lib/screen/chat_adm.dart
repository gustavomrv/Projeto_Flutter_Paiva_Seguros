// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, curly_braces_in_flow_control_structures, unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:paiva_seguros/screen/home_cliente.dart';
import 'package:query/query.dart';
import 'package:paiva_seguros/screen/login.dart';
import 'package:paiva_seguros/screen/drawer_cliente.dart';
import 'package:paiva_seguros/store/chat_cliente_store.dart';
import 'package:backendless_sdk/backendless_sdk.dart';


class ChatAdmScreen extends StatelessWidget {
  DateTime _tempo = DateTime.now();
  ChatAdmScreen({Key? key}) : super(key: key);
  var store_chat = GetIt.I<ChatClienteStore>();
  //CollectionReference mensagens = FirebaseFirestore.instance.collection('mensagem');
  @override
  Widget build(BuildContext context) {

    dynamic dados_cliente = ModalRoute.of(context)?.settings.arguments;
    String email = dados_cliente["email"];
    String nome = dados_cliente["nome"];

    var mensagens_juntas = FirebaseFirestore.instance.collection("mensagem").orderBy('tempo');
    
    return Scaffold(   
      appBar: AppBar(
        title: Text(nome), 
        backgroundColor: Colors.red,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacementNamed(
            context,
            "/contatos_adm_screen",
          )
        ),  
      ),
      resizeToAvoidBottomInset: false,      

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(   
        child: Column(
          children: [             
            StreamBuilder<QuerySnapshot>(
              // stream: FirebaseFirestore.instance.collection("mensagem").where('remetente', isEqualTo: email).where('destinatario', isEqualTo: "gustavomourago@gmail.com").orderBy('tempo').snapshots(),
              stream: mensagens_juntas.snapshots(),
              builder: (context, snap) {
                if (snap.hasData) {
                  List<DocumentSnapshot> documents = snap.data!.docs;
                  return Column(
                    children: [
                      ListView(
                        shrinkWrap: true,
                        children:           
                        documents.map(
                          (e) => Column(
                            children: [
                              if (e['remetente'] == email)
                                  Card(
                                  child: Column(
                                    children: [
                                      Container(      
                                        padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Row(
                                                children: <Widget>[                                                
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.transparent,
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Text(nome, maxLines: 1,style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 110, 201)),),
                                                          SizedBox(height: 3,),
                                                          Text(e['texto'],style: TextStyle(fontSize: 13,color: Colors.black,)),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10,),
                                                  CircleAvatar(
                                                    backgroundImage: NetworkImage('https://fwctecnologia.com/static/avatar-cliente-projeto-aplicativo-fwc-tecnologia-cuiaba.webp'),
                                                    maxRadius: 20,
                                                  ),
                                                ],
                                              ),
                                            ),                                            
                                            //Text(('${_tempo.hour}:${_tempo.minute}'),style: TextStyle(fontSize: 10),),
                                          ],
                                        ),
                                      ),        
                                    ],
                                  ),                                  
                                  color: Color.fromARGB(255, 244, 250, 255),
                                ),
                              if (e['destinatario'] == email)
                                Card(
                                  child: Column(
                                    children: [
                                      Container(      
                                        padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Row(
                                                children: <Widget>[
                                                  CircleAvatar(
                                                    backgroundImage: NetworkImage('https://preview.redd.it/4q0gyrkf00081.jpg?auto=webp&s=f4e3f2fdcefe33f88d87cc1839ccb59c27772ed7'),
                                                    maxRadius: 20,
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.transparent,
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Text('Gustavo Moura Barros',maxLines: 1, style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 180, 12, 0)),),
                                                          SizedBox(height: 3,),
                                                          Text(e['texto'],style: TextStyle(fontSize: 13,color: Colors.black,)),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  
                                                ],
                                              ),
                                            ),                                            
                                            //Text(('${_tempo.hour}:${_tempo.minute}'),style: TextStyle(fontSize: 10),),
                                          ],
                                        ),
                                      ),        
                                    ],
                                  ),                                  
                                  color: Color.fromARGB(255, 255, 242, 242),
                                ),
                            ],
                          ),                  
                        ).toList(),               
                                                       
                      ),
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
                                  onPressed: store_chat.save(context, email),
                                  icon: Icon(Icons.send,color: Colors.red),
                                ),
                              ),
                            );
                          }),
                      ),
                      SizedBox(height: 200, child: Scaffold(backgroundColor: Colors.white,)), 
                      SizedBox(height: 50, child: Scaffold(backgroundColor: Colors.red,)), 
                    ],
                  );
                }
                 else
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  );
              },              
            ),
          ],
        ),
      ),
      )
    );
  }
}
