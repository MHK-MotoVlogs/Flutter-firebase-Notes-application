import 'package:flutter/material.dart';
import 'package:notepad/core/utils/consts/colors/colors.dart';
import 'package:notepad/core/utils/consts/heading_text_style/heading_text_style.dart';
import 'package:notepad/ui/custom_widgets/sized_box/sized_box.dart';

myDialogueBox(BuildContext context, String heading, String description,
    VoidCallback onpress, IconData iconData, String iconText) {
  return showDialog(
      context: context,
      builder: (context) {
        /// Returning dialog box

        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(8.0),

            /// main column having heading description and action button

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                /// heading text

                Text(
                  heading,
                  style: kHeadingTextStyle,
                  textAlign: TextAlign.center,
                ),
                const HeightSizedBox(),

                /// Description text

                Text(
                  description,
                  textAlign: TextAlign.center,
                ),
                const HeightSizedBox(),

                /// action elevated button

                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: kBoarderColor,
                    ),
                    onPressed: onpress,
                    icon: Icon(iconData),
                    label: Text(iconText)),
              ],
            ),
          ),
        );
      });
}
