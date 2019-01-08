import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
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
              obscureText: true,
            ),
            SizedBox(height: 20,),
            RaisedButton(
                child: Text("Login"),
                color: Colors.lightBlue,
                elevation: 7,
                textColor: Colors.white,
                onPressed: (){
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _email,
                      password: _password
                  ).then((FirebaseUser user){
                    Navigator.of(context).pushReplacementNamed("/homepage");
                  }
                  ).catchError((e){
                    print(e);
                  });
                }
            ),
            SizedBox(height: 15,),
            Text("Don't have account?"),
            SizedBox(height: 10,),
            OutlineButton(
                child: Text("Sign Up"),
                color: Colors.lightGreen,
                textColor: Colors.green,
                borderSide: BorderSide(
                    color: Colors.green,
                    style: BorderStyle.solid,
                    width: 4
                ),
                onPressed: (){
                  Navigator.of(context).pushNamed("/signup");
                }
            ),
          ],
        ),
      ),
    );
  }
}
