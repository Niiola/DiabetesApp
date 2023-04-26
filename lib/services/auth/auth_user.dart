import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/foundation.dart';

// creating our own user that will abstract the functionalities of the firebase user
@immutable
class AuthUser {
  final bool IsEmailVerified;
  const AuthUser(this.IsEmailVerified);

  //this is what creates our auth user from our firebase user
  factory AuthUser.fromFirebase(User user) => AuthUser(user.emailVerified); // we are usig user.emailVerified cos the only thing we are using the user identity for is to check if the email is verified
}
