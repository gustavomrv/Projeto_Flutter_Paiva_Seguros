// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, curly_braces_in_flow_control_structures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:query/query.dart';
import 'package:paiva_seguros/screen/login.dart';
import 'package:paiva_seguros/screen/my_drawer.dart';
import 'package:paiva_seguros/store/chat_cliente_store.dart';
import 'package:backendless_sdk/backendless_sdk.dart';


class ChatCliente extends StatelessWidget {

  ChatCliente({Key? key}) : super(key: key);
  var store_chat = GetIt.I<ChatClienteStore>();
  //CollectionReference mensagens = FirebaseFirestore.instance.collection('mensagem');
  @override
  Widget build(BuildContext context) {

    dynamic email_map = ModalRoute.of(context)?.settings.arguments;
    String email = email_map["email"];
    
    //dynamic mensagens_cliente = FirebaseFirestore.instance.collection("mensagem").where('remetente', isEqualTo: email).where('destinatario', isEqualTo: "gustavomourago@gmail.com").orderBy('tempo');
    //dynamic mensagens_corretor = FirebaseFirestore.instance.collection("mensagem").where('remetente', isEqualTo: "gustavomourago@gmail.com").where('destinatario', isEqualTo: email).orderBy('tempo');
    
    var nome_map = FirebaseFirestore.instance.collection("cliente").where('email', isEqualTo: email);
    String nome = '';

    StreamBuilder<QuerySnapshot>(
      stream: nome_map.snapshots(),
      builder: (context, snap) {
        if (snap.hasData) {
          List<DocumentSnapshot> documents = snap.data!.docs;
          documents.map(
            (e) => nome = e['nome'],
          ).toList();
        }
        return Column();
      }
    );

    var mensagens_juntas = FirebaseFirestore.instance.collection("mensagem").orderBy('tempo');
    
    return Scaffold(   
      appBar: AppBar(title: Text("Conversa com Gustavo Moura"), backgroundColor: Colors.red,),
      drawer: MyDrawer(),
      resizeToAvoidBottomInset: false,      
      //endDrawer: ChatCliente(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(   
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
      stream: nome_map.snapshots(),
      builder: (context, snap) {
        if (snap.hasData) {
          List<DocumentSnapshot> documents = snap.data!.docs;
          documents.map(
            (e) => nome = e['nome'],
          ).toList();
        }
        return Column();
      }
    ),
            
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
                                      ListTile(      
                                        onTap: (){},  
                                        hoverColor: Colors.black,              
                                        title: Text(e['texto']),
                                        subtitle: Text(nome),
                                      ),        
                                    ],
                                  ),
                                  color: Color.fromARGB(255, 238, 247, 255),
                                ),
                              if (e['destinatario'] == email)
                                  Card(
                                  child: Column(
                                    children: [
                                      ListTile(      
                                        onTap: (){},  
                                        hoverColor: Colors.black,              
                                        title: Text(e['texto']),
                                        subtitle: Text('Gustavo Moura Barros'),
                                      ),        
                                    ],
                                  ),
                                  color: Color.fromARGB(255, 255, 239, 235),
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
      
      // body: Container(
      //   child: SingleChildScrollView(    
      //     child: Column(
      //       children: [
              
      //         //SizedBox(height: 540,),
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Observer(builder: (_) {
      //               return TextField(
      //                 controller: store_chat.controllerTexto,
      //                 onChanged: (value) {
      //                   store_chat.setTexto(value);
      //                 },
      //                 decoration: InputDecoration(
      //                   isDense: true,
      //                   filled: true,
      //                   enabledBorder: OutlineInputBorder(
      //                     borderSide: BorderSide(color: Colors.red, width: 2.0),
      //                     borderRadius: BorderRadius.circular(20.0),
      //                   ),
      //                   border: OutlineInputBorder(
      //                     borderSide: BorderSide(color: Colors.red, width: 2.0),
      //                     borderRadius: BorderRadius.circular(20.0),
      //                   ),
      //                   labelText: 'Mensagem',
      //                   hintText: 'Digite sua mensagem',
      //                   errorText: store_chat.isValidTexto,
      //                   suffixIcon: IconButton(
      //                     onPressed: store_chat.save(context, email),
      //                     icon: Icon(Icons.send,color: Colors.red),
      //                   ),
      //                 ),
      //               );
      //             }),
      //         ),
      //         SizedBox(height: 50, child: Scaffold(backgroundColor: Colors.red,)), 
      //       ],
      //     ),
      //   ),
      // ),
      )
    );
  }
}
