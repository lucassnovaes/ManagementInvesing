import 'package:flutter/material.dart';
import 'package:managementinvesting/Login/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ManagementInvesting",
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: LoginPage(),
    );
  }
}
