import 'package:docalc/mvc/controller/register_controller.dart';
import 'package:docalc/mvc/view/register_screen/register_dialog.dart';
// import 'package:docalc/mvc/view/reusable_component/confirmation_dialog.dart';
// import 'package:docalc/mvc/view/reusable_component/loading_dialog.dart';
// import 'package:docalc/mvc/view/reusable_component/success_dialog.dart';
import 'package:docalc/resource/resource_manager.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterController registerController = RegisterController();
  late final RegisterDialog registerDialog = RegisterDialog();

  Widget fullNameUITextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: PaddingMarginManager.labelTextField,
          child: const Text(
            'Full Name',
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
          padding: PaddingMarginManager.onlyRight6,
          height: SizeManager.textFieldContainerHeight,
          margin: PaddingMarginManager.textField,
          child: TextField(
            style: const TextStyle(fontSize: FontSizeManager.headlineBody),
            controller: registerController.fullNameUIController,
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
              hintText: "Enter your full name",
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
            registerController.fullNameError,
            style: const TextStyle(
              fontSize: FontSizeManager.subheadFootnote,
              color: ColorManager.negative,
            ),
          ),
        )
      ],
    );
  }

  Widget userNameUITextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: PaddingMarginManager.labelTextField,
          child: const Text(
            'User Name',
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
          padding: PaddingMarginManager.onlyRight6,
          height: SizeManager.textFieldContainerHeight,
          margin: PaddingMarginManager.textField,
          child: TextField(
            style: const TextStyle(fontSize: FontSizeManager.headlineBody),
            controller: registerController.userNameUIController,
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
              hintText: "Enter your user name",
              prefixIcon: Icon(
                Icons.account_circle_outlined,
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
            registerController.userNameError,
            style: const TextStyle(
              fontSize: FontSizeManager.subheadFootnote,
              color: ColorManager.negative,
            ),
          ),
        )
      ],
    );
  }

  Widget genderUISegmented() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: PaddingMarginManager.labelTextField,
          child: const Text(
            'Gender',
            style: TextStyle(
              color: ColorManager.subheadFootnote,
              fontSize: FontSizeManager.subheadFootnote,
            ),
          ),
        ),
        Container(
          margin: PaddingMarginManager.textField,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusManager.textfieldRadius,
          ),
          child: SegmentedButton<Gender>(
            segments: <ButtonSegment<Gender>>[
              ButtonSegment<Gender>(
                icon: Icon(
                  Icons.male_outlined,
                  color: Theme.of(context).colorScheme.primary,
                  size: 26,
                ),
                value: Gender.male,
                label: const Text(
                  'Male',
                  style: TextStyle(
                      fontSize: FontSizeManager.headlineBody,
                      fontWeight: FontWeight.normal),
                ),
              ),
              ButtonSegment<Gender>(
                icon: Icon(
                  Icons.female_outlined,
                  color: Theme.of(context).colorScheme.primary,
                  size: 26,
                ),
                value: Gender.female,
                label: const Text(
                  'Female',
                  style: TextStyle(
                      fontSize: FontSizeManager.headlineBody,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
            selected: <Gender>{registerController.userGender},
            showSelectedIcon: false,
            style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: const VisualDensity(vertical: -2),
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusManager.textfieldRadius,
              ),
            ),
            onSelectionChanged: (Set<Gender> newSelection) {
              setState(() {
                registerController.genderSegmentedButtonPressed(newSelection);
              });
            },
          ),
        ),
        Container(
          margin: PaddingMarginManager.labelTextField,
          child: const Text(
            "",
            style: TextStyle(
              fontSize: FontSizeManager.subheadFootnote,
              color: ColorManager.negative,
            ),
          ),
        )
      ],
    );
  }

  Widget dateOfBirthlUIDatePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: PaddingMarginManager.labelTextField,
          child: const Text(
            'Date of Birth',
            style: TextStyle(
                fontSize: FontSizeManager.subheadFootnote,
                color: ColorManager.subheadFootnote),
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
            onTap: () {
              setState(() {
                registerController.dobDatePickerPressed(context);
              });
            },
            readOnly: true,
            style: const TextStyle(fontSize: FontSizeManager.headlineBody),
            controller: registerController.dateOfBirthUIController,
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
              hintText: "Enter your date of birth",
              prefixIcon: Icon(
                Icons.calendar_month_outlined,
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
            registerController.dobError,
            style: const TextStyle(
              fontSize: FontSizeManager.subheadFootnote,
              color: ColorManager.negative,
            ),
          ),
        )
      ],
    );
  }

  void medicJobModalPressed() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 6),
            Container(
              width: 38,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2, color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Choose Medical Job',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            SizedBox(
              height: 188,
              width: double.infinity,
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: double.infinity,
                    child: InkWell(
                      onTap: () {
                        registerController.medicJobModalListPressed(
                          context,
                          index,
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 6),
                        child: Text(
                          registerController.medicalJobItems[index],
                          style: const TextStyle(
                            fontSize: FontSizeManager.headlineBody,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 0.5, color: ColorManager.separator),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                itemCount: registerController.medicalJobItems.length,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget medicJobUIModal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: PaddingMarginManager.labelTextField,
          child: const Text(
            'Medical Job',
            style: TextStyle(
                fontSize: FontSizeManager.subheadFootnote,
                color: ColorManager.subheadFootnote),
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
            onTap: () {
              setState(() {
                medicJobModalPressed();
              });
            },
            readOnly: true,
            style: const TextStyle(fontSize: FontSizeManager.headlineBody),
            controller: registerController.medicJobUIController,
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
              hintText: "Enter your medical job",
              prefixIcon: Icon(
                Icons.medical_information_outlined,
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
            registerController.medicJobError,
            style: const TextStyle(
              fontSize: FontSizeManager.subheadFootnote,
              color: ColorManager.negative,
            ),
          ),
        )
      ],
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
                color: ColorManager.subheadFootnote),
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
            controller: registerController.emailUIController,
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
              hintText: "example@email.com",
              prefixIcon: Icon(
                Icons.email_outlined,
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
            registerController.emailError,
            style: const TextStyle(
              fontSize: FontSizeManager.subheadFootnote,
              color: ColorManager.negative,
            ),
          ),
        )
      ],
    );
  }

  Widget phoneNumberUITextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: PaddingMarginManager.labelTextField,
          child: const Text(
            'Phone Number',
            style: TextStyle(
                fontSize: FontSizeManager.subheadFootnote,
                color: ColorManager.subheadFootnote),
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
            keyboardType: TextInputType.phone,
            style: const TextStyle(fontSize: FontSizeManager.headlineBody),
            controller: registerController.phoneNumberUIController,
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
              hintText: "081234567890",
              prefixIcon: Icon(
                Icons.phone_outlined,
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
            registerController.phoneNumberError,
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
            controller: registerController.passwordUIController,
            obscureText: registerController.isSecure,
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
                    registerController.securePasswordTextfieldPressed();
                  });
                },
                icon: Icon(
                  registerController.securePasswordIcon,
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
            registerController.passwordError,
            style: const TextStyle(
              fontSize: FontSizeManager.subheadFootnote,
              color: ColorManager.negative,
            ),
          ),
        )
      ],
    );
  }

  Widget confirmPasswordUITextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: PaddingMarginManager.labelTextField,
          child: const Text(
            'Confirm Password',
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
            controller: registerController.confirmPasswordUIController,
            obscureText: registerController.isSecureConfirm,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: "Confirm your password",
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
                    registerController.secureConfirmPasswordTextfieldPressed();
                  });
                },
                icon: Icon(
                  registerController.secureConfirmPasswordIcon,
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
            registerController.confirmPasswordError,
            style: const TextStyle(
              fontSize: FontSizeManager.subheadFootnote,
              color: ColorManager.negative,
            ),
          ),
        )
      ],
    );
  }

  Widget registerUIButton() {
    return SizedBox(
      height: 34,
      width: double.infinity,
      child: FilledButton(
        onPressed: () {
          // setState(() {
          //   final bool isSatisfied =
          //       registerController.registerButtonPressed(context);
          //   if (isSatisfied) {
          //     registerAlertDialog();
          //   }
          // });
          registerDialog.registerAlertDialog(context);
        },
        style: FilledButton.styleFrom(
          backgroundColor: ColorManager.primary,
          foregroundColor: ColorManager.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: const Text(
          'Register',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        registerDialog.cancelAlertDialog(context);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Register',
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                fullNameUITextField(),
                const SizedBox(height: 16),
                userNameUITextField(),
                const SizedBox(height: 16),
                dateOfBirthlUIDatePicker(),
                const SizedBox(height: 16),
                genderUISegmented(),
                const SizedBox(height: 16),
                medicJobUIModal(),
                const SizedBox(height: 16),
                emailUITextField(),
                const SizedBox(height: 16),
                phoneNumberUITextField(),
                const SizedBox(height: 16),
                passwordUITextField(),
                const SizedBox(height: 16),
                confirmPasswordUITextField(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          height: BottomAppBarManager.regular,
          child: registerUIButton(),
        ),
      ),
    );
  }
}
