import 'dart:async';

import 'package:docalc/mvc/view/reusable_component/cancel_back_dialog.dart';
import 'package:docalc/mvc/view/reusable_component/confirmation_dialog.dart';
import 'package:docalc/mvc/view/reusable_component/loading_dialog.dart';
import 'package:docalc/mvc/view/reusable_component/success_dialog.dart';
import 'package:flutter/material.dart';

class RegisterDialog {
  Future<bool> cancelAlertDialog(BuildContext context) async {
    return (await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => const CancelBackDialog(
                  cancelDialogText:
                      'Apakah anda yakin untuk membatalkan data perubahan order ini?',
                  cancelDialogTitle: 'Membatalkan Perubahan Data Order',
                ))) ??
        false;
  }

  void registerAlertDialog(BuildContext context) async {
    bool? action = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const ConfirmationDialog(
            confirmDialogTitle: 'Register New Account',
            confirmDialogText:
                'Are you sure your data is correct to register?');
      },
    );
    if (action == true) {
      if (context.mounted) {
        loadingAlertDialog(context);
        loading(context);
      }
    }
  }

  void loadingAlertDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const LoadingDialog();
      },
    );
  }

  void successAlertDialog(BuildContext context) {
    showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const SuccessDialog(
          successDialogText: 'Berhasil menyimpan data order',
        );
      },
    );
  }

  void loading(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pop();
        successAlertDialog(context);
      },
    );
  }
}
