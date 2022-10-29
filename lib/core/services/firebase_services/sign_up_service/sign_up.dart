import 'package:firebase_auth/firebase_auth.dart';
import 'package:notepad/core/models/user_details_model/user_model.dart';
import 'package:notepad/core/services/firebase_services/firebase_user_info_service/firebase_user_info_insertion.dart';

Future<bool> firsebaseSignUp(UserModel userModel) async {
  ///firebase instance initialization

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  /// async function of user creation

  late UserCredential userCredential;

  /// try block for firebase authenticaiton

  try {
    userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: userModel.email, password: userModel.password);

    ///checking for user to return bool

    if (userCredential.user != null) {
      /// calling firebasefirestore user info method to store name uid and email of user

      firebaseUserInfoInsertion(userCredential, userModel);

      return true;
    } else
      return false;
  }

  ///Firebase exception catch block

  on FirebaseAuthException catch (error) {
    print(" error is : ${error.toString()}");
    return false;
  }
  ;
}
