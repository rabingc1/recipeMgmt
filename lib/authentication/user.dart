/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipemgmt/id.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserManagement {
  storeNewUser(user, context) async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('users')
        .document(firebaseUser.uid)
        .setData({'email': user.email, 'uid': user.uid})
        .then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => id())))
        .catchError((e) {
      print(e);
    });
  }
}

}


*/
