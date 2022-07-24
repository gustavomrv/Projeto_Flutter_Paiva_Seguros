// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:paiva_seguros/screen/login.dart';

class DrawerCliente extends StatelessWidget {
  const DrawerCliente({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
          child: Text(""),
          decoration: BoxDecoration(color: Colors.red),
        ),
        SizedBox(height: 450,),
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            bottomLeft: Radius.circular(32),
            ),
          child: ListTile(
            leading: Icon(Icons.open_in_browser, color: Colors.red, size: 30,),
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
