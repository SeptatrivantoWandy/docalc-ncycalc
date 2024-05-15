import 'package:docalc/mvc/controller/login_controller.dart';
import 'package:docalc/resource/resource_manager.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController loginController = LoginController();

  Widget welcomeDisplaysUIView() {
    return const Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.local_hospital_rounded,
            color: ColorManager.primary,
            size: 224,
          ),
          Text(
            'DoCalc',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: FontSizeManager.largeTitle,
              fontWeight: FontWeight.bold,
              color: ColorManager.blackText,
            ),
          ),
        ],
      ),
    );
  }

  Widget emailUITextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: PaddingMarginManager.labelTextField,
          child: const Text(
            'Email',
            style: TextStyle(
              fontSize: FontSizeManager.subheadFootnote,
              color: ColorManager.subheadFootnote
            ),
          ),
        ),
        const SizedBox(height: 2),
        Container(
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadiusManager.textfieldRadius,
          ),
          padding: PaddingMarginManager.onlyRight6,
          height: SizeManager.textFieldContainerHeight,
          margin: PaddingMarginManager.textField,
          child: TextField(
            style: const TextStyle(fontSize: FontSizeManager.headlineBody),
            controller: loginController.emailUIController,
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
              hintText: "example@email.com",
              prefixIcon: Icon(
                Icons.person_outline_rounded,
                size: 26,
                color: ColorManager.primary,
              ),
              prefixIconConstraints: BoxConstraints(
                minWidth: 36,
                minHeight: 34,
              ),
            ),
          ),
        ),
        const SizedBox(height: 2),
        Container(
          margin: PaddingMarginManager.labelTextField,
          child: Text(
            loginController.emailError,
            style: const TextStyle(
              fontSize: FontSizeManager.subheadFootnote,
              color: ColorManager.negative,
            ),
          ),
        )
      ],
    );
  }

  Widget passwordUITextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: PaddingMarginManager.labelTextField,
          child: const Text(
            'Password',
            style: TextStyle(
              color: ColorManager.subheadFootnote,
              fontSize: FontSizeManager.subheadFootnote,
            ),
          ),
        ),
        const SizedBox(height: 2),
        Container(
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadiusManager.textfieldRadius,
          ),
          height: SizeManager.textFieldContainerHeight,
          margin: PaddingMarginManager.textField,
          child: TextField(
            style: const TextStyle(fontSize: FontSizeManager.headlineBody),
            controller: loginController.passwordUIController,
            obscureText: loginController.isSecure,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: "Enter your password",
              prefixIcon: const Icon(
                Icons.lock_outline_rounded,
                size: 26,
                color: ColorManager.primary,
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 36,
                minHeight: 34,
              ),
              suffixIcon: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    loginController.securePasswordTextfieldPressed();
                  });
                },
                icon: Icon(
                  loginController.securePasswordIcon,
                  size: 26,
                  color: ColorManager.primary,
                ),
              ),
              suffixIconConstraints: const BoxConstraints(
                minWidth: 36,
                minHeight: 34,
              ),
            ),
          ),
        ),
        const SizedBox(height: 2),
        Container(
          margin: PaddingMarginManager.labelTextField,
          child: Text(
            loginController.passwordError,
            style: const TextStyle(
              fontSize: FontSizeManager.subheadFootnote,
              color: ColorManager.negative,
            ),
          ),
        )
      ],
    );
  }

  Widget loginUIButton() {
    return SizedBox(
      height: 34,
      width: double.infinity,
      child: FilledButton(
        onPressed: () {
          setState(() {
            loginController.loginButtonPressed();
          });
        },
        style: FilledButton.styleFrom(
          backgroundColor: ColorManager.primary,
          foregroundColor: ColorManager.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: const Text(
          'Login',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget registerUIButton() {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          loginController.registerButtonPressed(context);
        },
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dont have acount? '
            ),
            Text(
              'Register',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: SizedBoxManager.largeSpace),
              welcomeDisplaysUIView(),
              const SizedBox(height: 64),
              emailUITextField(),
              const SizedBox(height: 16),
              passwordUITextField()
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: BottomAppBarManager.regular + 26,
        child: Column(
          children: [
            loginUIButton(),
            const SizedBox(height: 6),
            registerUIButton()
          ],
        ),
      ),
    );
  }
}
