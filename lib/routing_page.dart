/*

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipemgmt/signin.dart';
import 'homescreen.dart';

class routingpage extends StatelessWidget {
  const routingpage({super.key});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return const homescreen();
          }else
          {
            return const signin();
          }
        },

      ),
    );
  }
}
*/
