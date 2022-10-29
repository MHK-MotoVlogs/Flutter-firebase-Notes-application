import 'package:cloud_firestore/cloud_firestore.dart';

class NotesModel {
  String title;
  String description;
  String time;

  NotesModel(
      {required this.title, required this.description, required this.time});

  static NotesModel convertToNotesModel(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> map = documentSnapshot.data() as Map<String, dynamic>;
    return NotesModel(
        title: map["title"],
        description: map["description"],
        time: map["time"]);
  }
}
