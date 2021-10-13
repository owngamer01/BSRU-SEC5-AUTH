
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/auth/model/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AuthController {

  final users = FirebaseFirestore.instance.collection('users');
  final refImage = firebase_storage.FirebaseStorage.instance.ref('users');

  void onLogin(String email, String password) async {
    try {

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, 
        password: password
      );

      

    } catch (e) {
      print(e);
    }
  }

  void onRegister(UserModel userModel) async {
    try {

      // # สมัครสมาชิกกับ Firebase provider
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userModel.username,
        password: userModel.password!
      );

      // # เก็บรูปภาพ profile ลงใน clound store
      String profilePath = "${userCredential.user!.uid}/profile";
      await refImage.child(profilePath).putFile(File(userModel.avatarPath!));
      final imageFile = await refImage.child(profilePath).getDownloadURL();

      // # ส่งข้อมูล เก็บลงฐานข้อมูล Firestore
      await users.doc(userCredential.user!.uid).set({
        "username": userModel.username,
        "fullname": userModel.fullname,
        "age": userModel.age,
        "avatarPath": imageFile
      });

      print("------------------ ${userCredential.user}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}