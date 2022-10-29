import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:notepad/core/services/firebase_services/current_user_credentials/current_user.dart';

firebaseClearAllNotes() async {
  /// declaration of batch

  WriteBatch myBatch = FirebaseFirestore.instance.batch();
  try {
    /// creating batch of docs

    await FirebaseFirestore.instance
        .collection("Notes")
        .doc(CurrentUser.currentUser().uid.toString())
        .collection("mynotes")
        .get()
        .then((QuerySnapshot) {
      QuerySnapshot.docs.forEach((element) {
        myBatch.delete(element.reference);
      });

      /// commiting batch to process

      myBatch.commit();
    });
  } catch (error) {
    print(error.toString());
  }
}
