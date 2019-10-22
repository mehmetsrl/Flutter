import 'package:flutter/material.dart';
import './auth_provider.dart';
import './login_page.dart';
import './home_page.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

enum AuthStatus { notSignIn, signIn }

class _RootPageState extends State<RootPage> {
  AuthStatus _authStatus = AuthStatus.notSignIn;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var auth = AuthProvider.of(context).auth;

    auth.currentUser().then((userId) {
      setState(() {
        _authStatus = userId == null ? AuthStatus.notSignIn : AuthStatus.signIn;
      });
    });
  }

  void _signedIn() {
    setState(() {
      _authStatus = AuthStatus.signIn;
    });
  }

  void _signedOut() {
    setState(() {
      _authStatus = AuthStatus.notSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_authStatus) {
      case AuthStatus.notSignIn:
        return LoginPage(
          onSignedIn: _signedIn,
        );
      case AuthStatus.signIn:
        return HomePage(
          onSignedOut: _signedOut,
        );
      default:
        return Container(
          child: Text('Fallback Scene'),
        );
    }
  }
}
