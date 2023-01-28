import 'package:flutter/material.dart';

class Info extends StatefulWidget {

  @override
  _State createState() => new _State();
}

enum Groups { groupe1, groupe2, groupe3 }
class _State extends State<Info> {

  bool isChecked1 = false;
  bool isChecked2 = false;

  final formKey = GlobalKey<FormState>();
  String _value = '';

  void _onChange(String value){
    setState(() => _value = 'Change: ${value} ');
  }
  void _onSubmit(String value){
    setState(() => _value = 'Change: ${value} ');
  }

  /*void _onPressed(){
    setState(() {
      _value = new DateTime.now().toString();
    });
  }*/
  /*void _add(){
    setState(() {
      _value++;
    });
  }*/
  /*void _subtract(){
    setState(() {
      _value--;
    });
  }*/

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2099));
    if(picked != null) setState(() => _value = picked.toString());
  }

  @override
  static const String _title = 'First Application';
  Groups? _character = Groups.groupe1;
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(32.0),
          child: Form(
            key: formKey,
            child: new Column(
                children: <Widget>[
                  new Text('Value = ${_value}'),
                  new TextFormField(
                    decoration: new InputDecoration(
                        labelText: 'Nom',
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
                    onChanged: _onChange,
                    //onSubmitted: _onSubmit,
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(
                        labelText: 'Prénom',
                        hintText: 'Tapez votre prénom',
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
                    onChanged: _onChange,
                    //onSubmitted: _onSubmit,
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(
                        labelText: 'Email',
                        hintText: 'Tapez votre email',
                        icon: new Icon(Icons.email)
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
                    keyboardType: TextInputType.emailAddress,
                    onChanged: _onChange,
                    //onSubmitted: _onSubmit,
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(
                        labelText: 'Password',
                        hintText: 'Tapez votre password',
                        icon: new Icon(Icons.password)
                    ),
                    validator: (value){
                      /*if(value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value!)){
                    return "Enter a correct name";
                  } else{
                    return null;
                  }*/
                    },
                    autocorrect: true,
                    autofocus: true,
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: _onChange,
                    //onSubmitted: _onSubmit,
                  ),
                  new CheckboxListTile(
                    value: isChecked1,
                    onChanged: (bool? value){
                      setState(() {
                        isChecked1 = value!;});
                    },
                    title: new Text('Archive1'),
                    controlAffinity: ListTileControlAffinity.leading,
                    subtitle: new Text('Subtitle'),
                    secondary: new Icon(Icons.archive),
                    activeColor: Colors.red,
                  ),
                  new CheckboxListTile(
                    value: isChecked2,
                    onChanged: (bool? value){
                      setState(() {
                        isChecked2 = value!;});
                    },
                    title: new Text('Archive1'),
                    controlAffinity: ListTileControlAffinity.leading,
                    subtitle: new Text('Subtitle'),
                    secondary: new Icon(Icons.archive),
                    activeColor: Colors.green,
                  ),
                  new ElevatedButton(
                    onPressed: _selectDate,
                    child: new Text("Date d'inscription"),
                  ),
                  ListTile(
                    title: const Text("Groupe1"),
                    leading: Radio<Groups>(
                      value: Groups.groupe1,
                      groupValue: _character,
                      onChanged: (Groups? value){
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text("Groupe1"),
                    leading: Radio<Groups>(
                      value: Groups.groupe2,
                      groupValue: _character,
                      onChanged: (Groups? value){
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text("Groupe1"),
                    leading: Radio<Groups>(
                      value: Groups.groupe3,
                      groupValue: _character,
                      onChanged: (Groups? value){
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
                    child: const Text('Gradient'),
                  ),
                ]),
          )
      ),
    );
  }
}