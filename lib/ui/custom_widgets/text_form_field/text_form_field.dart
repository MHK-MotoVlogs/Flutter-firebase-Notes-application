import 'package:flutter/material.dart';
import 'package:notepad/core/utils/consts/colors/colors.dart';

class TextFormFields extends StatelessWidget {
  TextFormFields({super.key, required this.hintText, required this.controller});

  /// hint text argument

  String hintText;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    /// text form field widget

    return TextFormField(
      controller: controller,
      cursorColor: kBoarderColor,

      /// decoration of field

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: kBoarderColor),

        /// focused border style

        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kBoarderColor),
        ),

        ///enabled border

        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kBoarderColor),
        ),
      ),
    );
  }
}
