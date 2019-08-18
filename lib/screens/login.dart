//import 'package:flutter/material.dart';
//import 'package:clasick_flutter/screens/home.dart';
//import 'package:clasick_flutter/screens/signup.dart';
//
//class Login extends StatefulWidget {
//  @override
//  _LoginState createState() => new _LoginState();
//}
//
//class _LoginState extends State<Login> {
//  TextEditingController userID = new TextEditingController();
//  TextEditingController userPass = new TextEditingController();
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Clasick'),
//      ),
//      body: new Container(
//          padding: const EdgeInsets.all(16.0),
//          margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
//          child: new Column(
//            mainAxisSize: MainAxisSize.min,
//            children: <Widget>[
//              new Container(
//                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
//                child: new TextFormField(
//                  controller: userID,
//                  decoration: InputDecoration(
//                      border: new OutlineInputBorder(
//                          borderSide: new BorderSide(color: Colors.teal)),
//                      labelText: 'User ID',
//                      hintText: 'Please enter a search term'),
//                ),
//              ),
//              new Container(
//                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
//                child: new TextFormField(
//                  controller: userPass,
//                  decoration: InputDecoration(
//                      border: new OutlineInputBorder(
//                          borderSide: new BorderSide(color: Colors.teal)),
//                      labelText: 'Password',
//                      hintText: 'Please enter a search term'),
//                ),
//              ),
//              new Container(
//                  margin: const EdgeInsets.all(4.0),
//                  child: ButtonTheme(
//                    minWidth: 80.0,
//                    height: 40.0,
//                    child: new RaisedButton(
//                      child: const Text(
//                        'Login',
//                        style: TextStyle(
//                          color: Colors.white,
//                          fontSize: 15.0,
//                        ),
//                      ),
//                      color: Colors.green,
//                      shape: RoundedRectangleBorder(),
//                      onPressed: () {
//                        Navigator.pushReplacement(context,
//                            MaterialPageRoute(builder: (context) => Home()));
//                      },
//                    ),
//                  )),
//              Container(
//                child: ButtonTheme(
//                  minWidth: 80.0,
//                  height: 40.0,
//                  child: new RaisedButton(
//                    child: const Text(
//                      'SignUp',
//                      style: TextStyle(
//                        color: Colors.white,
//                        fontSize: 15.0,
//                      ),
//                    ),
//                    color: Colors.green,
//                    shape: RoundedRectangleBorder(),
//                    onPressed: () {
//                      Navigator.push(context,
//                          MaterialPageRoute(builder: (context) => SignUp()));
//                    },
//                  ),
//                ),
//              )
//            ],
//          )),
//    );
//  }
//}
