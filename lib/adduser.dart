/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<AddUser> {


  @override
  Widget build(BuildContext context){
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      return users
          .add({
        'full_name': "Anas AKZAZ",
        'age': 22
      }, SetOptions(merge: true),
      )
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }


  }

}*/