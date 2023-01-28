import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Getusername extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<Getusername> {
  String? get documentId => null;


  FutureBuilder<DocumentSnapshot> getUsername() {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

          if(snapshot.hasError) {
            return Text("Something went wrong");
          }
          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }
          if(snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            return Text("Full Name; ${data['full_name']}");
          }
          return Text('None of theme');
        }
    );

    //Call the user's CollectionReference to add a new user

    /*return users
        .add({
      'full_name': _name.text,
      'company': _company.text,
      'age': age
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));*/
  }


  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new Text('Add Widgets Here getusername')
          ],
        ),
      ),
    );
  }
}