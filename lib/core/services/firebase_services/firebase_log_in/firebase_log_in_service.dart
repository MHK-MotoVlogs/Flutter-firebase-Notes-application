import 'package:firebase_auth/firebase_auth.dart';
import 'package:notepad/core/models/user_details_model/user_model.dart';

Future<bool> firebaseLogIn(UserModel userModel) async {
  /// initializing firebase Auth instance

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  /// trying sign in

  try {
    UserCredential userCredential =
        await firebaseAuth.signInWithEmailAndPassword(
            email: userModel.email, password: userModel.password);

    /// checking user for return bool

    if (userCredential.user != null) {
      return true;
    } else
      return false;
  }

  /// on firebase exception

  on FirebaseAuthException catch (error) {
    print("Error occur: ${error.toString()}");

    return false;
  }
}
