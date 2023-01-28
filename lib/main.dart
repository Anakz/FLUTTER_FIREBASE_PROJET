import 'package:first_flutter/signin.dart';
import 'package:first_flutter/signup.dart';
import 'package:flutter/material.dart';
import 'formulaire.dart';
import 'getuser.dart';
import 'getusername.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async{
  /*runApp(const MyApp());*/
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {

  final String _value = 'MINI-PROJET FLUTTER';
  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;

      if(index ==1){
        Navigator.push(context,MaterialPageRoute(builder: (context) => Signin() ));
      }
      if(index ==2){
        Navigator.push(context,MaterialPageRoute(builder: (context) => Signup() ));
      }
    });
  }

  @override
  Widget build(BuildContext context){

    return MaterialApp(
      home: Scaffold(
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
                new TextButton(onPressed: () => _onItemTapped(2), child: new Text('Sign-in')),
                new TextButton(onPressed: () => _onItemTapped(3), child: new Text('Sign-up')),
                new TextButton(onPressed: () => Navigator.pop(context), child: new Text('Close'),)
              ],
            ),
          ),
        ),
        backgroundColor: Colors.blueGrey[50],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  radius: 110.0,
                  backgroundColor: Colors.lightBlueAccent,
                  backgroundImage: AssetImage('assets/undraw.png'),
                ),

                Text(
                  'Created By : Younes SEFIANI & Anas AKZAZ',
                  style: TextStyle(
                      fontFamily: 'Yellowtail',
                      fontSize: 40,
                      color: Colors.black),
                ),
                Text(
                  'Class: 5IIR 3',
                  style: TextStyle(
                      fontFamily: 'Big Shoulders Display',
                      fontSize: 35,
                      color: Colors.black),
                ),
                SizedBox(height: 5.0,),
                /*Card(
                  margin: EdgeInsets.symmetric(horizontal: 33.0),
                  color: Colors.blue,
                  child: ListTile(
                    /*leading: Icon(Icons.chat, size: 35, color: Colors.white),*/
                    title: Text(
                      '',
                      /*style: GoogleFonts.teko(
                        textStyle: TextStyle(color: Colors.white, fontSize: 35),
                      ),*/
                    ),
                  ),
                ),*/
                SizedBox(height: 10.0),
                /*Card(
                  margin: EdgeInsets.symmetric(horizontal: 33.0),
                  color: Colors.blue[100],
                  child: ListTile(
                    /*Icon(Icons.call_made, size: 35, color: Colors.white),*/
                    title: Text(
                      '',
                      /*style: GoogleFonts.teko(
                        textStyle: TextStyle(color: Colors.white, fontSize: 35),
                      ),*/
                    ),
                  ),
                )*/
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.login),
              label: 'Signin',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Signup',
            )
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}