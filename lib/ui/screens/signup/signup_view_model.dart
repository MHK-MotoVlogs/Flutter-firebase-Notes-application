import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notepad/core/models/user_details_model/user_model.dart';
import 'package:notepad/core/services/firebase_services/sign_up_service/sign_up.dart';
import 'package:notepad/ui/screens/login/login_screen.dart';

class SignUpViewModel extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signUp(BuildContext context) async {
    /// checking that the controller is not null

    if (nameController.text != "" &&
        emailController.text != "" &&
        passwordController.text != "") {
      /// storing controllers data in model

      UserModel userModel = UserModel(
          email: emailController.text,
          name: nameController.text,
          password: passwordController.text);

      /// Firebase signup function call

      bool check = await firsebaseSignUp(userModel);
      if (check) {
        /// disposing name controller

        nameController.dispose();

        /// Navigation to another screen

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Login()));
      } else
        print("some thing went wrong");
    }

    /// one of the field is empty

    else {
      print("one of the field is empty");
    }
  }

  logInNavigation(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Login()));
  }
}
