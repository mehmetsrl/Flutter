import 'package:flutter/material.dart';
import 'package:login_app/auth_provider.dart';
import './root_page.dart';
import './auth.dart';
import './auth_provider.dart';
import 'package:firebase_database/firebase_database.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  FirebaseDatabase db = FirebaseDatabase();

  @override
  Widget build(BuildContext context) {
    return AuthProvider(
        auth: AuthFirebase(),
        child: MaterialApp(
          title: 'Flutter Login App',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: RootPage(),
        ));
  }
}
