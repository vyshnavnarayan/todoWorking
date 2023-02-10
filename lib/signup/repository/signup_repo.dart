import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:very_good_app/login/view/login_page.dart';
import 'package:very_good_app/signup/bloc/signup_bloc.dart';


  Future<void> createUser(UserSignupEvent event) async {
    final _auth = FirebaseAuth.instance;
    final CollectionReference userRef =
        FirebaseFirestore.instance.collection('usercollection');
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      await userRef.doc(userCredential.user!.uid).set({
        'Userid': _auth.currentUser!.uid,
        'Username': event.name,
        'Email': event.email,
        'Phone': event.phonenumber,
        'Password':event.password,
        'Profile_image':''
      }); 
      
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw Exception('signup failed');
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text(e.code)));
    }
  }

