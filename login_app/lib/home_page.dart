import 'package:flutter/material.dart';
import './auth_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({this.onSignedOut});

  final VoidCallback onSignedOut;

  void _signOut(BuildContext context) async {
    try {
      var auth = AuthProvider.of(context).auth;
      auth.signedOut();
      onSignedOut();
    } catch (ex) {
      print(ex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Log Out',
              style: TextStyle(fontSize: 17.0, color: Colors.white),
            ),
            onPressed: ()=> _signOut(context),
          )
        ],
      ),
      body: Container(
        child: Center(
            child: Text(
          'Welcome',
          style: TextStyle(fontSize: 32.0),
        )),
      ),
    );
  }



  
}
