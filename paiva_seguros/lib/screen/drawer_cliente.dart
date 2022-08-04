// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paiva_seguros/screen/login.dart';

class DrawerCliente extends StatelessWidget {
  const DrawerCliente({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic email_map = ModalRoute.of(context)?.settings.arguments;
    String email = email_map["email"];
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
          child: Column(
            children: [
              CircleAvatar(                                                  
                backgroundImage: NetworkImage('https://fwctecnologia.com/static/avatar-cliente-projeto-aplicativo-fwc-tecnologia-cuiaba.webp'),
                maxRadius: 65,
              ),
            ],
          ),
          decoration: BoxDecoration(color: Colors.red),
        ),        
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            bottomLeft: Radius.circular(32),
            ),
          child: ListTile(
            leading: Icon(Icons.house_sharp, color: Colors.red, size: 30,),
            title: Text('Início', style: TextStyle(color: Colors.red, fontSize: 18),),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                "/home_cliente_screen",
                arguments: {"email": email}
              );
            },
            selected: true,
          ),
        ),
        SizedBox(height: 10,),
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            bottomLeft: Radius.circular(32),
            ),
          child: ListTile(
            leading: Icon(Icons.add_home_sharp, color: Colors.red, size: 30,),
            title: Text('Seguro Residencial', style: TextStyle(color: Colors.red, fontSize: 18),),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                "/cliente_seguro_residencial_screen",
                arguments: {"email": email}
              );
            },
            selected: true,
          ),
        ),
        SizedBox(height: 10,),
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            bottomLeft: Radius.circular(32),
            ),
          child: ListTile(
            leading: Icon(Icons.handshake_sharp, color: Colors.red, size: 30,),
            title: Text('Seguro Empresarial', style: TextStyle(color: Colors.red, fontSize: 18),),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                "/cliente_seguro_empresarial_screen",
                arguments: {"email": email}
              );
            },
            selected: true,
          ),
        ),
        SizedBox(height: 10,),
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            bottomLeft: Radius.circular(32),
            ),
          child: ListTile(
            leading: Icon(Icons.pedal_bike, color: Colors.red, size: 30,),
            title: Text('Seguro Bike', style: TextStyle(color: Colors.red, fontSize: 18),),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                "/chat_cliente_screen",
                arguments: {"email": email}
              ); 
            },
            selected: true,
          ),
        ),
        SizedBox(height: 10,),
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            bottomLeft: Radius.circular(32),
            ),
          child: ListTile(
            leading: Icon(Icons.monetization_on, color: Colors.red, size: 30,),
            title: Text('Consórcio', style: TextStyle(color: Colors.red, fontSize: 18),),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                "/chat_cliente_screen",
                arguments: {"email": email}
              ); 
            },
            selected: true,
          ),
        ),
        SizedBox(height: 130,),
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            bottomLeft: Radius.circular(32),
            ),
          child: ListTile(
            leading: Icon(Icons.open_in_browser_sharp, color: Colors.red, size: 30,),
            title: Text('Sair', style: TextStyle(color: Colors.red, fontSize: 18),),
            onTap: () {
              Navigator.of(context)
                .push(MaterialPageRoute(builder: (v) => LoginScreen()));
            },
            selected: true,
          ),
        ),
      ]),
    );
  }
}
