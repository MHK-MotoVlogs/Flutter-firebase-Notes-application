import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notepad/core/models/notes_model/notes_model.dart';
import 'package:notepad/core/services/firebase_services/current_user_credentials/current_user.dart';

/// Firebase notes insertion function

firebaseNotesInsertion(NotesModel notesModel, BuildContext context) async {
  /// firebase instance

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  /// exceptional handling

  try {
    /// waiting for firebase insertion

    await firebaseFirestore
        .collection("Notes")
        .doc(CurrentUser.currentUser().uid.toString())
        .collection("mynotes")
        .doc(notesModel.time)
        .set(

            /// data which will be added

            {
          "title": notesModel.title,
          "description": notesModel.description,
          "time": notesModel.time
        })

        /// on successful insertion

        .then((value) =>

            /// snackbar showing success

            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
              "Successful insertion of notes",
              textAlign: TextAlign.center,
            ))));
  }

  /// catching error

  catch (error) {
    /// snackbar showing exception

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Exception Occures: ${error.toString()}")));
  }
}
