import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notepad/core/models/user_details_model/user_model.dart';

firebaseUserInfoInsertion(
    UserCredential userCredential, UserModel userModel) async {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  try {
    await firebaseFirestore
        .collection("Notes")
        .doc(userCredential.user!.uid.toString())
        .set({
      "uid": userCredential.user!.uid,
      "name": userModel.name,
      "email": userModel.email,
    }).then((value) => {print("Data added successfuly")});
  } catch (error) {
    print("Something went wrong from firebase insertion: ${error.toString()}");
  }
}
