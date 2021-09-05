import 'package:firebase_user_avatar_flutter/app/home/home_page.dart';
import 'package:firebase_user_avatar_flutter/app/sign_in/sign_in_page.dart';
import 'package:firebase_user_avatar_flutter/services/firebase_auth_service.dart';
import 'package:firebase_user_avatar_flutter/services/firebase_storage_service.dart';
import 'package:firebase_user_avatar_flutter/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Builds the signed-in or non signed-in UI, depending ont he user snapshot
// This widget shoul dbe below the [MaterialApp].
// An [AuthWidgetBuilder] ancestor is required for this widget to work
class AuthWidget extends StatelessWidget {
  const AuthWidget({Key key, @required this.userSnapshot}) : super(key: key);
  final AsyncSnapshot<User> userSnapshot;

  @override
  Widget build(BuildContext context) {
    print('Auth Widget build');
    if (userSnapshot.connectionState == ConnectionState.active) {
      return userSnapshot.hasData ? HomePage() : SignInPage();
    }
    // If connection state not active, just show loading
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
