import 'package:flutter/material.dart';

class LoginScreen 

extends StatelessWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      body: Column(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(height: 50,),
                const Image(
                  image: NetworkImage('https://paivacorretora.com.br/wp-content/uploads/2020/09/cropped-Logo-Paiva-Corretora-2-218x75.png'),
                  width: 400,
                  height: 350,
                ),                
              ],
            ),
          ),

          
        ],
      ),
    );
  }
}