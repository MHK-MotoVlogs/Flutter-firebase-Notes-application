import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notepad/core/models/notes_model/notes_model.dart';
import 'package:notepad/core/utils/consts/colors/colors.dart';
import 'package:notepad/core/utils/consts/heading_text_style/heading_text_style.dart';
import 'package:notepad/ui/custom_widgets/sized_box/sized_box.dart';
import 'package:notepad/ui/screens/home_page/home_page_view_model.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/consts/greeting_list/greeting_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageViewModel(),
      builder: (context, child) =>
          Consumer<HomePageViewModel>(builder: (context, model, child) {
        return Scaffold(
          /// appbar for more and user greeting

          appBar: AppBar(
            /// User greetings

            title: Row(
              children: [
                /// Name of user
                FutureBuilder(
                    future: model.getUserName(),
                    builder: (context, snapshot) {
                      model.getNotes();
                      return snapshot.hasData
                          ? Text(snapshot.data!.name)
                          : const Text("Name");
                    }),

                /// greetings text

                Text(" ${greetingList[model.greetingChooser()]}"),
              ],
            ),

            /// action icon button for clear all and logout buttons

            actions: [
              DropdownButton(
                  underline: Container(),
                  icon: const Icon(Icons.more_vert),
                  items: const [
                    DropdownMenuItem(
                      value: "logOut",
                      child: Text("Log Out"),
                    ),
                    DropdownMenuItem(
                      value: "clearAll",
                      child: Text("Clear All"),
                    )
                  ],
                  onChanged: (value) {
                    model.selectMenuItem(value!, context);
                  }),
            ],
          ),

          /// Floating action button for adding Notes

          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            foregroundColor: kBoarderColor,
            onPressed: () {
              model.floatingNavigation(context);
            },
            child: const Icon(Icons.add),
          ),

          /// Body start having Main Column

          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Expanded Future Builder that builds Masonary grid view

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: StreamBuilder(
                        stream: model.getNotes(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          return snapshot.hasData
                              ? MasonryGridView.builder(
                                  crossAxisSpacing: 2.0,
                                  mainAxisSpacing: 2.0,
                                  gridDelegate:

                                      /// cross axis count

                                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2),
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    /// convert snapshot into Notes model

                                    NotesModel notesModel =
                                        model.convertSnapshotToNotesModel(
                                            snapshot.data!.docs[index]);

                                    /// Card kind of container havind title, description, and time

                                    return InkWell(
                                      onTap: () {
                                        model.moveToDetailsScreen(
                                            notesModel, context);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),

                                          /// Column of container

                                          child: Column(children: [
                                            /// Title of notes

                                            Text(
                                              notesModel.title,
                                              style: kHeadingTextStyle.copyWith(
                                                  color: Colors.white),
                                            ),
                                            const HeightSizedBox(),

                                            /// Description of notes

                                            Text(
                                              notesModel.description,
                                              maxLines: model
                                                  .descriptionMaxLinesLogic(),
                                            ),
                                            const HeightSizedBox(),

                                            /// time of notes storage

                                            Text(
                                              notesModel.time,
                                              style: const TextStyle(
                                                  fontSize: 10.0),
                                            ),
                                            const HeightSizedBox(),

                                            /// Delete Icon

                                            Container(
                                              decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                              child: IconButton(
                                                  onPressed: () {
                                                    model
                                                        .firebaseSingleNoteDeletion(
                                                            notesModel.time,
                                                            context);
                                                  },
                                                  icon:
                                                      const Icon(Icons.delete)),
                                            ),
                                          ]),
                                        ),
                                      ),
                                    );
                                  })
                              : CircularProgressIndicator(
                                  color: kBoarderColor,
                                );
                        }),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
