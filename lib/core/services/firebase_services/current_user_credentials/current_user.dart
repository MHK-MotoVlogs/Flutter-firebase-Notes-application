import 'package:firebase_auth/firebase_auth.dart';

class CurrentUser {
  static User currentUser() {
    return FirebaseAuth.instance.currentUser!;
  }
}
