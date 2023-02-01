import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ManageProfile {
  Future<void> updateProfile(XFile image) async {
    final profileCollection =
        FirebaseFirestore.instance.collection('usercollection');
    final referance = FirebaseStorage.instance
        .ref()
        .child('profile_images')
        .child(image.name);
    final _auth = FirebaseAuth.instance;
    final file = File(image.path);
    await referance.putFile(file);
    final imageLink = await referance.getDownloadURL();

    await profileCollection
        .doc(_auth.currentUser!.uid)
        .update({'Profile_image': imageLink});
  }
}
