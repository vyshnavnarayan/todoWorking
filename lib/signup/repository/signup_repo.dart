import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/login/view/login_page.dart';

class SignupRepo {
  Future<void> createUser(String Email, String Password, BuildContext context,
      String Username, String phonenumber) async {
    final _auth = FirebaseAuth.instance;
    final CollectionReference userRef =
        FirebaseFirestore.instance.collection('usercollection');
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: Email,
        password: Password,
      );
      await userRef.doc(userCredential.user!.uid).set({
        'Username': Username,
        'Email': Email,
        'Phone': phonenumber,
        'Password':Password,
        'Profile_image':''
      }); 
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.code)));
    }
  }
}
