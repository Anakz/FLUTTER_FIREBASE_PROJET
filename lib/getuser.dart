import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'formulaire.dart';
import 'signup.dart';
import 'signin.dart';
import 'adduserform.dart';

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').snapshots();

  void _onItemTapped(int index){
    setState(() {

      if(index == 0){
        //Navigator.push(context,MaterialPageRoute(builder: (context) => main() ));
        Navigator.popUntil(context, ModalRoute.withName('/'));
      }
      if(index == 1){
        Navigator.push(context,MaterialPageRoute(builder: (context) => Formulaire()));
      }
      if(index ==2){
        Navigator.push(context,MaterialPageRoute(builder: (context) => Signin() ));
      }
      if(index ==3){
        Navigator.push(context,MaterialPageRoute(builder: (context) => Signup() ));
      }
      if(index ==4){
        Navigator.push(context,MaterialPageRoute(builder: (context) => AddUserForm() ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return

      StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.hasError) {
            return Text('Something went wrong');
          }
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return Scaffold (
              appBar: AppBar(
                title: Center(
                  child: Text('Welcome to the Flutter Application'),
                ),
              ),
              drawer: new Drawer(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      new TextButton(onPressed: () => _onItemTapped(0), child: new Text('Home')),
                      new TextButton(onPressed: () => _onItemTapped(1), child: new Text('Formulaire')),
                      new TextButton(onPressed: () => _onItemTapped(2), child: new Text('Sign-in')),
                      new TextButton(onPressed: () => _onItemTapped(3), child: new Text('Sign-up')),
                      new TextButton(onPressed: () => Navigator.pop(context), child: new Text('Close'),)
                    ],
                  ),
                ),
              ),
              body: ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                  return ListTile(
                    title: Text("Name: " + data['full_name']+ " ; Age: "+ data['age'].toString()),
                    subtitle: Text("Company: "+data['company']),
                  );
                }).toList(),
              ),
            persistentFooterButtons: [
              new TextButton(onPressed: () => _onItemTapped(4), child: Text("Add new user to the list"))
            ],
          );
        },
      );
  }}