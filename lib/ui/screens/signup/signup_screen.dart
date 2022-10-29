import 'package:flutter/material.dart';
import 'package:notepad/core/utils/consts/heading_text_style/heading_text_style.dart';
import 'package:notepad/ui/custom_widgets/sized_box/sized_box.dart';
import 'package:notepad/ui/custom_widgets/text_form_field/text_form_field.dart';
import 'package:notepad/ui/screens/signup/signup_view_model.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpViewModel(),
      builder: (context, index) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),

            /// Main body column

            child: Consumer<SignUpViewModel>(
              builder: (context, model, child) {
                return Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// Page header Text

                        const Text(
                          "Sign Up",
                          style: kHeadingTextStyle,
                        ),
                        const HeightSizedBox(),

                        /// Reusbale TextFormField

                        TextFormFields(
                            hintText: "Enter Full Name",
                            controller: model.nameController),
                        const HeightSizedBox(),

                        /// Reusbale TextFormField

                        TextFormFields(
                          hintText: "abc@gmail.com",
                          controller: model.emailController,
                        ),
                        const HeightSizedBox(),

                        /// Reusbale TextFormField

                        TextFormFields(
                          hintText: "Enter Password",
                          controller: model.passwordController,
                        ),
                        const HeightSizedBox(),

                        /// instructions for having account.

                        Row(
                          children: [
                            const Text("I have an account"),
                            TextButton(
                                onPressed: () {
                                  model.logInNavigation(context);
                                },
                                child: Text(
                                  "LogIn",
                                  style: kHeadingTextStyle,
                                ))
                          ],
                        ),

                        /// Elevated button help to sign up

                        ElevatedButton(
                          onPressed: () {
                            model.signUp(context);
                          },
                          child: Text(
                            "Sign Up",
                            style: kHeadingTextStyle.copyWith(
                                fontWeight: FontWeight.normal),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
