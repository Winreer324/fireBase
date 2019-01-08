import 'package:fire_base_raja/fireBase/login_page.dart';
import 'package:fire_base_raja/fireBase/sign_up_page.dart';
import 'package:fire_base_raja/fireBase/home_page_aut.dart';

import 'package:flutter/material.dart';

void main() => runApp(Authentication());

//lessons 23
// Flutter - Authentication
//link video https://www.youtube.com/watch?v=5v3n8bCrpv0&list=PLgGjX33Qsw-EMsLf8TmsYhKOCx2ALZiKi&index=32

class Authentication extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Authentication',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        "/landingpage": (BuildContext context) => Authentication(),
        "/signup": (BuildContext context) => SignUpPage(),
        "/homepage": (BuildContext context) => HomePage()
      },
    );
  }
}