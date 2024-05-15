import 'package:docalc/mvc/view/register_screen/register_view.dart';
import 'package:flutter/material.dart';

class LoginController {
  IconData securePasswordIcon = Icons.visibility_off_outlined;
  bool isSecure = true;
  String emailError = "";
  String passwordError = "";
  TextEditingController passwordUIController = TextEditingController();
  TextEditingController emailUIController = TextEditingController();

  void viewDidLoad() {}

  void securePasswordTextfieldPressed() {
    isSecure = !isSecure;
    securePasswordIcon =
        isSecure ? Icons.visibility_off_outlined : Icons.visibility_outlined;
  }

  void loginButtonPressed() {
    if (passwordUIController.text.isEmpty) {
      passwordError = "password must not empty!";
    } else {
      passwordError = "";
    }

    if (emailUIController.text.isEmpty) {
      emailError = "Email must not empty!";
    } else {
      emailError = "";
    }
  }

  void registerButtonPressed(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const RegisterView(),
      ),
    );
  }
}
