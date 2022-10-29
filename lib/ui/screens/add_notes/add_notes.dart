import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:notepad/core/utils/consts/colors/colors.dart';
import 'package:notepad/core/utils/consts/heading_text_style/heading_text_style.dart';
import 'package:notepad/ui/custom_widgets/sized_box/sized_box.dart';
import 'package:notepad/ui/custom_widgets/text_form_field/text_form_field.dart';
import 'package:notepad/ui/screens/add_notes/add_notes_view_model.dart';
import 'package:provider/provider.dart';

class AddNotes extends StatelessWidget {
  const AddNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        /// change notifier provider

        child: ChangeNotifierProvider(
          create: (context) => AddNotesViewModel(),
          builder: ((context, child) {
            /// consumer widget to provide changes

            return Consumer<AddNotesViewModel>(
              builder: (context, model, child) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// Heading text of page

                      const Text(
                        "Add Notes",
                        style: kHeadingTextStyle,
                      ),
                      const HeightSizedBox(),

                      /// textformfield imported from class for title

                      TextFormFields(
                        hintText: "Type title of Notes",
                        controller: model.titleController,
                      ),
                      const HeightSizedBox(),

                      /// Description form field

                      TextFormField(
                        controller: model.descriptionController,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          hintText: "Description Here...",
                          hintStyle: kHeadingTextStyle,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kBoarderColor)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kBoarderColor),
                          ),
                        ),
                      ),
                      const HeightSizedBox(),

                      /// Elevated button for notes addition in database.

                      ElevatedButton(
                        onPressed: () {
                          model.insertNotes(context);
                        },
                        child: Text(
                          "Add",
                          style: kHeadingTextStyle,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
