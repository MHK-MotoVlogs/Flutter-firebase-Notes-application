import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:notepad/core/models/notes_model/notes_model.dart';
import 'package:notepad/core/utils/consts/colors/colors.dart';
import 'package:notepad/core/utils/consts/heading_text_style/heading_text_style.dart';
import 'package:notepad/ui/custom_widgets/sized_box/sized_box.dart';

class NotesDetails extends StatelessWidget {
  NotesDetails({super.key, required this.notesModel});
  NotesModel notesModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notesModel.title,
                style: kHeadingTextStyle.copyWith(fontSize: 25.0),
              ),
              const HeightSizedBox(),
              Text(
                notesModel.time,
                style: TextStyle(color: kBoarderColor.withOpacity(0.4)),
              ),
              const HeightSizedBox(),
              Text(
                notesModel.description,
                style: TextStyle(color: kBoarderColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
