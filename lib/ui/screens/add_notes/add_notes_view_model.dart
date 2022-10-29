import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notepad/core/models/notes_model/notes_model.dart';
import 'package:notepad/core/services/firebase_services/firebase_notes_services/firebase_notes_insertion.dart';
import 'package:notepad/ui/screens/home_page/home_page_screen.dart';

class AddNotesViewModel extends ChangeNotifier {
  /// controllers for add screen

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  /// insertion method of notes

  insertNotes(BuildContext context) async {
    /// checking for controller value

    if (titleController.text != '' && descriptionController != '') {
      /// creating notes model

      NotesModel notesModel = NotesModel(
          title: titleController.text,
          description: descriptionController.text,
          time: DateTime.now().toString());

      /// calling firebase service of insertion

      await firebaseNotesInsertion(notesModel, context);

      /// Navigation to home page after insertion of notes.

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomePage();
      }));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("one of the field is empty:")));
    }
  }
}
