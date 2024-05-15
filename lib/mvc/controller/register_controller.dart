import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Gender {
  male('Male'),
  female('Female');

  const Gender(this.label);
  final String label;
}

class RegisterController {
  String fullNameError = "";
  String userNameError = "";
  String dobError = "";
  String medicJobError = "";
  String emailError = "";
  String phoneNumberError = "";
  String passwordError = "";
  String confirmPasswordError = "";

  bool isSatisfied = false;
  bool isSecure = true;
  bool isSecureConfirm = true;
  IconData securePasswordIcon = Icons.visibility_off_outlined;
  IconData secureConfirmPasswordIcon = Icons.visibility_off_outlined;
  Gender userGender = Gender.male;
  DateTime? selectedDate;
  String userAge = '';
  final List<String> medicalJobItems = [
    'Dokter',
    'Perawat',
    'Mahasiswa Kedokteran',
    'Tenaga Medis',
    'Lainnya'
  ];
  late Timer timer;

  TextEditingController fullNameUIController = TextEditingController();
  TextEditingController userNameUIController = TextEditingController();
  TextEditingController dateOfBirthUIController = TextEditingController();
  TextEditingController medicJobUIController = TextEditingController();
  TextEditingController emailUIController = TextEditingController();
  TextEditingController phoneNumberUIController = TextEditingController();
  TextEditingController passwordUIController = TextEditingController();
  TextEditingController confirmPasswordUIController = TextEditingController();

  bool isAdult(String birthDateString) {
    String datePattern = "MM/dd/yyyy";

    // Current time - at this moment
    DateTime today = DateTime.now();

    // Parsed date to check
    DateTime birthDate = DateFormat(datePattern).parse(birthDateString);

    // Date to check but moved 18 years ahead
    DateTime adultDate = DateTime(
      birthDate.year + 12,
      birthDate.month,
      birthDate.day,
    );
    return adultDate.isBefore(today);
  }

  void genderSegmentedButtonPressed(Set<Gender> newSelection) {
    userGender = newSelection.first;
  }

  void dobDatePickerPressed(BuildContext context) async {
    final formatter = DateFormat.yMMMMd();
    final formatterAdult = DateFormat.yMd();
    final now = DateTime.now();
    final initialDate = selectedDate ?? DateTime.now();
    final firstDate = DateTime(now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: now,
    );
    selectedDate = pickedDate ?? selectedDate ?? now;
    userAge = formatterAdult.format(selectedDate!);
    dateOfBirthUIController.text = formatter.format(selectedDate!);
  }

  void securePasswordTextfieldPressed() {
    isSecure = !isSecure;
    securePasswordIcon =
        isSecure ? Icons.visibility_off_outlined : Icons.visibility_outlined;
  }

  void secureConfirmPasswordTextfieldPressed() {
    isSecureConfirm = !isSecureConfirm;
    secureConfirmPasswordIcon = isSecureConfirm
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
  }

  void medicJobModalListPressed(BuildContext context, int index) {
    medicJobUIController.text = medicalJobItems[index];
    Navigator.pop(context);
  }

  bool registerButtonPressed(BuildContext context) {
    if (fullNameUIController.text.isEmpty) {
      fullNameError = "Full name must not empty!";
    } else if (fullNameUIController.text.length < 5 ||
        fullNameUIController.text.length > 20) {
      fullNameError = "Fullname length must between 5 to 20";
    } else {
      fullNameError = "";
    }

    if (userNameUIController.text.isEmpty) {
      userNameError = "User name must not empty!";
    } else if (userNameUIController.text.length < 5 ||
        userNameUIController.text.length > 20) {
      userNameError = "Username length must between 5 to 20";
    } else if (userNameUIController.text.toString().contains(' ')) {
      userNameError = "Username must not contain space";
    } else {
      userNameError = "";
    }

    if (dateOfBirthUIController.text.isEmpty) {
      dobError = "Date of birth must not empty!";
    } else if (isAdult(userAge) == false) {
      dobError = "To use this app, your minimum age is 12 years old";
    } else {
      dobError = "";
    }

    if (medicJobUIController.text.isEmpty) {
      medicJobError = "Medical job must not empty";
    } else {
      medicJobError = "";
    }

    if (emailUIController.text.isEmpty) {
      emailError = "Email must not empty!";
    } else if (emailUIController.text.toString().trim().contains(' ')) {
      emailError = 'Email address must not contain space';
    } else {
      final bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(
        emailUIController.text.toString().trim(),
      );
      if (emailValid == false) {
        emailError = "Email is not valid";
      } else {
        emailError = "";
      }
    }

    if (phoneNumberUIController.text.isEmpty) {
      phoneNumberError = "Phone number must not empty!";
    } else if (phoneNumberUIController.text.toString().trim().contains(' ')) {
      phoneNumberError = "Phone number must not contain space";
    } else {
      final bool phoneValid = RegExp(
        r"^(\+62|62|0)8[1-9][0-9]{6,9}$",
      ).hasMatch(
        phoneNumberUIController.text.toString().trim(),
      );
      if (phoneValid == false) {
        phoneNumberError = "Phone number is not valid";
      } else {
        phoneNumberError = "";
      }
    }

    if (passwordUIController.text.isEmpty) {
      passwordError = "Password must not empty!";
    } else {
      final bool passwordValid = RegExp(
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d\w\W]{8,}$",
      ).hasMatch(
        passwordUIController.text.toString().trim(),
      );
      if (passwordValid == false) {
        passwordError =
            'Password must contain atleast 8 characters, 1 uppercase letter, 1 lowercase letter, and 1 number';
      } else {
        passwordError = "";
      }
    }

    if (confirmPasswordUIController.text != passwordUIController.text) {
      confirmPasswordError = "Password confirmation does not match!";
    } else {
      confirmPasswordError = "";
    }

    if (fullNameError.isEmpty &&
        userNameError.isEmpty &&
        dobError.isEmpty &&
        medicJobError.isEmpty &&
        emailError.isEmpty &&
        phoneNumberError.isEmpty &&
        passwordError.isEmpty &&
        confirmPasswordError.isEmpty) {
      return true;
    }
    return false;
  }
}
