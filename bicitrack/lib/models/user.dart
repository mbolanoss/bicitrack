import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CustomUser {
  String? email;
  String? id;

  CustomUser(
    this.email,
    this.id,
  );

  CustomUser.fromUserAndPass(User user) {
    email = user.email!;
    id = user.uid;
  }
  CustomUser.fromGoogle(GoogleSignInAccount user) {
    email = user.email;
    id = user.id;
  }
}
