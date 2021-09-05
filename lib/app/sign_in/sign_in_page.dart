import 'package:firebase_user_avatar_flutter/services/firebase_auth_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      final auth = Provider.of<FirebaseAuthService>(context, listen: false);
      final user = await auth.signInAnonymously();
      print('uid: ${user.uid}');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign in')),
      body: Center(
        child: ElevatedButton(
          child: Text('Sign in anonymously'),
          onPressed: () => _signInAnonymously(context),
        ),
      ),
    );
  }
}
