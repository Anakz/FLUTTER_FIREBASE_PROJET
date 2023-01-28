import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './adduserform.dart';
import 'formulaire.dart';
import 'signup.dart';
import 'getuser.dart';

class Signin extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<Signin> {

  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  Future<void> Signin() async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _username.text, password: _password.text
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => UserInformation()));
    }
    catch(e) {
      print(e);
    }
  }

  void _onItemTapped(int index){
    setState(() {

      if(index == 0){
        //Navigator.push(context,MaterialPageRoute(builder: (context) => main() ));
        Navigator.popUntil(context, ModalRoute.withName('/'));
      }
      /*if(index == 1){
        Navigator.push(context,MaterialPageRoute(builder: (context) => Formulaire()));
      }
      if(index ==2){
        Navigator.push(context,MaterialPageRoute(builder: (context) => Signin() ));
      }*/
      if(index ==1){
        Navigator.push(context,MaterialPageRoute(builder: (context) => Signup() ));
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
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
                new Text('Hello Drawer'),
                new TextButton(onPressed: () => _onItemTapped(0), child: new Text('Home')),
                new TextButton(onPressed: () => _onItemTapped(1), child: new Text('Sign-up')),
                new TextButton(onPressed: () => Navigator.pop(context), child: new Text('Close'),)
              ],
            ),
          ),
        ),

    body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                child:
                new TextField(
                  decoration: new InputDecoration(
                      labelText: 'Username',
                      hintText: 'Entrer your username',
                      icon: new Icon(Icons.person)
                  ),
                  controller: _username,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child:
                new TextField(
                  obscureText: true,
                  decoration: new InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      icon: new Icon(Icons.lock)
                  ),
                  controller: _password,
                ),
              ),

              Container(
                  padding: EdgeInsets.all(30.0),
                  child: ElevatedButton(
                    onPressed: Signin,
                    child: Text("SignInIn"),
                  )
              )
            ],
          ),
        ));
  }
}