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


class ChatClienteScreen extends StatelessWidget {
  ChatClienteScreen({Key? key}) : super(key: key);

  final ScrollController _controller = ScrollController();

  void _scrollDown() {
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  var store_chat = GetIt.I<ChatClienteStore>();
  @override
  Widget build(BuildContext context) {
    
    dynamic email_map = ModalRoute.of(context)?.settings.arguments;
    String email = email_map["email"];

    var mensagens_juntas = FirebaseFirestore.instance.collection("mensagem").orderBy('tempo');
    
    return Scaffold(   
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: Colors.white,
        onPressed: _scrollDown,
        child: Icon(Icons.arrow_downward, color: Colors.red,),
      ),
      appBar: AppBar(
        title: Text("Conversa com Gustavo"), 
        backgroundColor: Colors.red,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacementNamed(
            context,
            "/home_cliente_screen",
            arguments: {"email": email}
          )
        ),          
      ),  
      bottomSheet: Padding(                
        padding: const EdgeInsets.all(8.0),  
        child: Observer(builder: (_) {
            return TextField(
              scrollPadding: EdgeInsets.only(bottom:40),
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
      body: StreamBuilder<QuerySnapshot>(
        stream: mensagens_juntas.snapshots(),
        builder: (context, snap) {
          if (snap.hasData) {
            List<DocumentSnapshot> documents = snap.data!.docs;
            return Padding(
              padding: EdgeInsets.all(1),
              child: 
                ListView(
                  controller: _controller,
                  reverse: false,
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
                                            CircleAvatar(
                                              backgroundImage: NetworkImage('https://fwctecnologia.com/static/avatar-cliente-projeto-aplicativo-fwc-tecnologia-cuiaba.webp'),
                                              maxRadius: 20,
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: Container(
                                                color: Colors.transparent,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text('Você', maxLines: 1,style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 110, 201)),),
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
                            color: Color.fromARGB(255, 255, 255, 255),
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
                                            
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: Container(
                                                color: Colors.transparent,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text('Gustavo Moura Barros',maxLines: 1, style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 17, 0)),),
                                                    SizedBox(height: 3,),
                                                    Text(e['texto'],style: TextStyle(fontSize: 13,color: Colors.black,)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            CircleAvatar(
                                              backgroundImage: NetworkImage('https://i.pinimg.com/originals/8b/16/7a/8b167af653c2399dd93b952a48740620.jpg'),
                                              maxRadius: 20,
                                            ),
                                          ],
                                        ),
                                      ),                                            
                                    ],
                                  ),
                                ),        
                              ],
                            ),                                  
                            color: Color.fromARGB(255, 253, 247, 247),
                          ),
                      ],
                    ),                  
                  ).toList(),                                                           
                ),             
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
    );
  }
}
