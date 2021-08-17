import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:together/HomePagePackage/home_page.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


FirebaseAuth auth = FirebaseAuth.instance;
String formattedDate = DateFormat('kk:mm:ss EEE d MMM').format(DateTime.now());
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
  //required File avatar,
  required String username,
  required String email,
  required String password,
  required  String phone,
  String? study,
  String? livesIn,
  String? from,
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
      "livesIn":livesIn,
      "from":from,
      "phone":phone,
      "created":formattedDate
    }).then((value) {
      // firebase_storage.FirebaseStorage.instance
      //     .ref()
      //     .child('users/${auth.currentUser!.uid}/avatar').putFile(avatar).then((value) {
      //   value.ref.getDownloadURL().then((value) {
      //     print("The download url is "+ value.toString());
      //     userInfo.doc(FirebaseAuth.instance.currentUser!.uid).update({
      //       "avatar":value
      //     }).then((_) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),)));
      //   });
      // });
    });
  });
}



