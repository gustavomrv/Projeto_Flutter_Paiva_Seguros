// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, sort_child_properties_last, curly_braces_in_flow_control_structures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paiva_seguros/screen/drawer_adm.dart';

class ContatosAdmScreen extends StatelessWidget {
  ContatosAdmScreen({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var clientes = FirebaseFirestore.instance.collection("cliente").orderBy('nome');
    return Scaffold(   
      appBar: AppBar(
        title: Text("Seus contatos"), 
        backgroundColor: Colors.red,
      ),
      drawer: DrawerAdm(),   
      resizeToAvoidBottomInset: false,      
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(   
        child: Column(
          children: [            
            StreamBuilder<QuerySnapshot>(
              stream: clientes.snapshots(),
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
                              if (e['email'] != 'gustavomourago@gmail.com')
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
                                                          Text(e['nome'], maxLines: 1,style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 110, 201)),),
                                                          SizedBox(height: 3,),
                                                          Text(e['email'],style: TextStyle(fontSize: 13,color: Colors.black,)),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 55,
                                                    height: 55,
                                                    child: ElevatedButton(
                                                      onPressed: (){
                                                        Navigator.pushReplacementNamed(
                                                          context,
                                                          "/chat_adm_screen",
                                                          arguments: {"email": e['email'], "nome": e['nome']}
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
                                          ],
                                        ),
                                      ),        
                                    ],
                                  ),                                  
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                            ],
                          ),                  
                        ).toList(),               
                                                       
                      ),
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