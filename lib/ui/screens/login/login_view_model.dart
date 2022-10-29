import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notepad/core/models/user_details_model/user_model.dart';
import 'package:notepad/core/services/firebase_services/firebase_log_in/firebase_log_in_service.dart';
import 'package:notepad/ui/screens/home_page/home_page_screen.dart';
import 'package:notepad/ui/screens/signup/signup_screen.dart';

class LoginInViewModel extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  logIn(BuildContext context) async {
    /// checking if emailController and passwordController contain data or not

    if (emailController.text != "" && passwordController.text != "") {
      /// creating usermodel

      UserModel userModel = UserModel(
          email: emailController.text, password: passwordController.text);

      /// calling firebase service method firebaselogIn

      bool check = await firebaseLogIn(userModel);

      /// checking either the service is completed successfuly or not

      if (check) {
        /// Navigation on successful completion of firebase service.

        Navigator.pushReplacement(
            context, (MaterialPageRoute(builder: (context) => HomePage())));
      } else
        return;
    }

    /// else part of controllers check

    else {
      print("one of the field is empty");
    }
  }

  /// Navigation to signup page

  signUpNavigation(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const SignUp()));
  }
}
