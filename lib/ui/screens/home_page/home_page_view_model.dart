import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notepad/core/models/notes_model/notes_model.dart';
import 'package:notepad/core/models/user_details_model/user_info/user_info.dart';
import 'package:notepad/core/services/firebase_services/firebase_clear_notes/firebase_clear_all_notes.dart';
import 'package:notepad/core/services/firebase_services/firebase_clear_notes/firebase_single_note_deletion.dart';
import 'package:notepad/core/services/firebase_services/firebase_log_out.dart/firebase_logout.dart';
import 'package:notepad/core/services/firebase_services/firebase_user_data_fetching/fetching_user_data.dart';
import 'package:notepad/core/services/firebase_services/firebase_user_data_fetching/fetching_user_notes.dart';
import 'package:notepad/ui/custom_widgets/dialogur_box/dialogue_box.dart';
import 'package:notepad/ui/screens/add_notes/add_notes.dart';
import 'package:notepad/ui/screens/login/login_screen.dart';
import 'package:notepad/ui/screens/notes_detail_screen/notes_details_screen.dart';

class HomePageViewModel extends ChangeNotifier {
  /// Floating action button navigation

  floatingNavigation(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddNotes()));
  }

  /// moving to details page where we can see the over description of notes

  moveToDetailsScreen(NotesModel notesModel, BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NotesDetails(notesModel: notesModel)));
  }

  /// calling function for conversion of snapshot document into notes model

  NotesModel convertSnapshotToNotesModel(DocumentSnapshot documentSnapshot) {
    return NotesModel.convertToNotesModel(documentSnapshot);
  }

  ///function for drop down menu item selection

  selectMenuItem(String value, BuildContext context) async {
    /// logic for which slected item function to be performed

    if (value == "logOut") {
      /// logout function running

      await firebaseLogOut();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    } else {
      /// clearing all notes

      myDialogueBox(context, "Warning!", "Are You Sure, Think Twice",
          deleteAllNotes, Icons.delete, "Delete");
    }
  }

  deleteAllNotes() {
    /// calling firebase clear service

    firebaseClearAllNotes();
  }

  /// chaniging greeting with time

  int greetingChooser() {
    /// getting system time hours

    int time = DateTime.now().hour;
    // firebaseFetchingNotes();

    /// condition for good morning

    if (time >= 1 && time <= 12) {
      return 0;
    }

    ///condition for good afternoon

    else if (time > 12 && time < 18) {
      return 1;
    }

    ///else for good night

    else {
      return 2;
    }
  }

  /// function for placing amount of text in description

  int descriptionMaxLinesLogic() {
    return Random().nextInt(6) + 2;
  }

  /// Fetching Name of user from
  Future<UserInfo> getUserName() async {
    UserInfo userInfo = await fetchingUserData();
    return userInfo;
  }

  /// Fetching notes of user form firebase

  getNotes() {
    return firebaseFetchingNotes();
  }

  /// firebase single note deletion

  firebaseSingleNoteDeletion(String myDate, BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    await firebaseSingleNoteDelete(myDate, context);
  }
}
