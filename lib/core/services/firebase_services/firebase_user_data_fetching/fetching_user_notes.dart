import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notepad/core/services/firebase_services/current_user_credentials/current_user.dart';

firebaseFetchingNotes() {
  /// Stream query of fetching notes from db

  return FirebaseFirestore.instance
      .collection("Notes")
      .doc(CurrentUser.currentUser().uid.toString())
      .collection("mynotes")
      .orderBy("time", descending: true)
      .snapshots();
}
