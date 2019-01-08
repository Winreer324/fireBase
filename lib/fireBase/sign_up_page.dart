import 'package:fire_base_raja/services/user_management.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: "Email"),
              onChanged: (value){
                setState(() {
                  _email = value;
                });
              },
            ),
            SizedBox(height: 15,),
            TextField(
              decoration: InputDecoration(hintText: "Password"),
              onChanged: (value){
                setState(() {
                  _password = value;
                });
              },
            ),
            SizedBox(height: 20,),
            RaisedButton(
                child: Text("Sign Up"),
                color: Colors.lightBlue,
                elevation: 7,
                textColor: Colors.white,
                onPressed: (){
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _email,
                      password: _password
                  ).then((signedInUser){
                    UserManagement().storeNewUser(signedInUser, context);
                  })
                  .catchError((e){
                    print(e);
                  });
                }
            ),
          ],
        ),
      ),
    );
  }
}
