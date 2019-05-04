import 'package:flutter/material.dart';
import 'package:clasick_flutter/screens/home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => new _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userID = new TextEditingController();
  TextEditingController userPass = new TextEditingController();
  TextEditingController userEmail = new TextEditingController();
  TextEditingController userPhone = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clasick'),
      ),
      body: Container(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: TextFormField(
                  controller: userID,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      labelText: 'User ID',
                      hintText: 'Please enter a search term'),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: TextFormField(
                  controller: userPass,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      labelText: 'Password',
                      hintText: 'Please enter a search term'),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: TextFormField(
                  controller: userEmail,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      labelText: 'Email',
                      hintText: 'Please enter a search term'),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: TextFormField(
                  controller: userPhone,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      labelText: 'Phone Number',
                      hintText: 'Please enter a search term'),
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(4.0),
                  child: ButtonTheme(
                    minWidth: 80.0,
                    height: 40.0,
                    child: new RaisedButton(
                      child: const Text(
                        'Regist',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                      color: Colors.green,
                      shape: RoundedRectangleBorder(),
                      onPressed: () {
                        //Navigator.pushNamed(context, '/home');
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                    ),
                  )),
            ],
          )),
    );
  }
}
