import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/login/view/login_page.dart';
import 'package:todo/signup/bloc/signup_bloc.dart';

 
  Future<void> createUser(UserSignupEvent event) async {
    final auth = FirebaseAuth.instance;
    final CollectionReference userRef =
        FirebaseFirestore.instance.collection('usercollection');
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      await userRef.doc(userCredential.user!.uid).set({
        'Userid': auth.currentUser!.uid,
        'Username': event.name,
        'Email': event.email,
        'Phone': event.phonenumber,
        'Password':event.password,
        'Profile_image':" "
      }); 
      
    } on FirebaseAuthException catch (e) {
     print(e);
     throw Exception('reg failed');
    }
  }

