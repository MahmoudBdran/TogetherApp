import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:together/HomePagePackage/home_page.dart';

FirebaseAuth auth = FirebaseAuth.instance;
CollectionReference userInfo=FirebaseFirestore.instance.collection("users");
signIn(BuildContext context,String email,String password) async {
  await auth
      .signInWithEmailAndPassword(
      email: email, password: password)
      .then((value){
    print("success");
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
  });
}
signUp(context, {
  required String avatar,
  required String username,
  required String email,
  required String password,
  required String dob,
  String? study,
  String? studyAt,
  String? work,
  String? workAt})async{
  await auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
    userInfo.doc(auth.currentUser!.uid).set({
      "username":username,
      "email":email,
      "uid":auth.currentUser!.uid,
      "avatar":"temp value",
      "study":study,
      "studyAt":studyAt,
      "work":work,
      "workAt":workAt,
      "dob":dob,
      "created":
    });
  });
}


