import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'getuser.dart';

class AddUserForm extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<AddUserForm> {

  final formKey = GlobalKey<FormState>();

  TextEditingController _name = new TextEditingController();
  TextEditingController _company = new TextEditingController();
  TextEditingController _age = new TextEditingController();
  int code = 0;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser() {

    //Call the user's CollectionReference to add a new user

    return users
        .add({
      'full_name': _name.text,
      'company': _company.text,
      'age': _age.text
    })
        .then((value) => {
          print("User Added"),
          Navigator.push(context,MaterialPageRoute(builder: (context) => UserInformation()))
        })
        .catchError((error) => print("Failed to add user: $error"));
  }
  Future<void> updateUser(){

    return users
        .doc('F6jfQtmDUIvVTY6uuHnq')
        .update({'company': 'Stokes and Sons'})
        .then((value) => {
          print("User Updated"),
          Navigator.push(context,MaterialPageRoute(builder: (context) => UserInformation()))
        })
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> deleteUser(){

    return users
        .doc('F6jfQtmDUIvVTY6uuHnq X')
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  Future<void> deleteField(){

    return users
        .doc('F6jfQtmDUIvVTY6uuHnq')
        .update({'age': FieldValue.delete()})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
          padding: EdgeInsets.all(30.0),
          child: Form(
            key: formKey,
            child: new Column(
                children: <Widget>[
                  new TextFormField(
                    decoration: new InputDecoration(
                        labelText: 'Full Name',
                        hintText: 'Tapez votre nom',
                        icon: new Icon(Icons.person)
                    ),
                    validator: (value){
                      if(value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value!)){
                        return "Enter a correct name";
                      } else{
                        return null;
                      }
                    },
                    autocorrect: true,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    onChanged: (value) => {_name.text= value},
                    //onSubmitted: _onSubmit,
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(
                        labelText: 'Company',
                        hintText: 'Write your company',
                        icon: new Icon(Icons.people)
                    ),
                    validator: (value){
                      if(value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value!)){
                        return "Enter a correct name";
                      } else{
                        return null;
                      }
                    },
                    autocorrect: true,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    onChanged: (value) => {_company.text= value},
                    //onSubmitted: _onSubmit,
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(
                        labelText: 'Age',
                        hintText: 'Write your age',
                        icon: new Icon(Icons.people)
                    ),
                    validator: (value){
                      if(value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value!)){
                        return "Enter a correct name";
                      } else{
                        return null;
                      }
                    },
                    autocorrect: true,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    onChanged: (value) => {_age.text= value},
                    //onSubmitted: _onSubmit,
                  ),

                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: addUser,
                    child: const Text('ADD'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: updateUser,
                    child: const Text('Update'),
                  ),
                ]),
          )
      )

    );
  }
}