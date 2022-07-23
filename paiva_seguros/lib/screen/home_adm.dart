// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:paiva_seguros/screen/my_drawer.dart';

class HomeAdmScreen extends StatelessWidget {
  HomeAdmScreen({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      appBar: AppBar(title: Text("Bem vindo Gustavo Moura"), backgroundColor: Colors.red,),
      drawer: MyDrawer(),
    );
  }
}