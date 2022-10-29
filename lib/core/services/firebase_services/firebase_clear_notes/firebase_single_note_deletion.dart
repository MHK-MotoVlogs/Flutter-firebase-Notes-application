import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:notepad/core/services/firebase_services/current_user_credentials/current_user.dart';

firebaseSingleNoteDelete(String myDate, BuildContext context) {
  FirebaseFirestore.instance
      .collection("Notes")
      .doc(CurrentUser.currentUser().uid.toString())
      .collection("mynotes")
      .doc(myDate)
      .delete()
      .then((value) {
    Navigator.pop(context);
  });
}
