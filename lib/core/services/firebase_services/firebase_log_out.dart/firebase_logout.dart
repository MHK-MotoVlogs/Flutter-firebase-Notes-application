import 'package:firebase_auth/firebase_auth.dart';

firebaseLogOut() async {
  await FirebaseAuth.instance.signOut();
}
