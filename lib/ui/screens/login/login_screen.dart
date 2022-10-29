import 'package:flutter/material.dart';
import 'package:notepad/core/utils/consts/heading_text_style/heading_text_style.dart';
import 'package:notepad/ui/custom_widgets/sized_box/sized_box.dart';
import 'package:notepad/ui/custom_widgets/text_form_field/text_form_field.dart';
import 'package:notepad/ui/screens/login/login_view_model.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        /// main body column

        child: ChangeNotifierProvider(
          create: (context) => LoginInViewModel(),
          builder: ((context, child) {
            return Consumer<LoginInViewModel>(
              builder: (context, model, child) {
                return Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// Heading of page

                        const Text(
                          "Log In",
                          style: kHeadingTextStyle,
                        ),
                        const HeightSizedBox(),

                        /// Text form field class for email

                        TextFormFields(
                          hintText: "abcd@gmail.com",
                          controller: model.emailController,
                        ),
                        const HeightSizedBox(),

                        /// Text form field class for password

                        TextFormFields(
                          controller: model.passwordController,
                          hintText: "*******",
                        ),
                        const HeightSizedBox(),

                        ///Instructions for sign up

                        Row(
                          children: [
                            const Text("I Don't have an account"),
                            TextButton(
                                onPressed: () {
                                  model.signUpNavigation(context);
                                },
                                child: Text(
                                  "SignUp!",
                                  style: kHeadingTextStyle,
                                ))
                          ],
                        ),
                        const HeightSizedBox(),

                        /// Elevated button for login

                        ElevatedButton(
                          onPressed: () {
                            model.logIn(context);
                          },
                          child: Text(
                            "Login",
                            style: kHeadingTextStyle.copyWith(
                                fontWeight: FontWeight.normal),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                        )
                      ],
                    ),
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
