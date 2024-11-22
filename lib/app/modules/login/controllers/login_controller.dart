import 'package:davnor_get/app/data/services/repository.dart';
import 'package:davnor_get/app/data/shared/shared_account.dart';
import 'package:davnor_get/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var usernameCtrlr = TextEditingController();
  var passwordCtrlr = TextEditingController();
  var isLoading = false.obs;

  bool validate() {
    return usernameCtrlr.text.isNotEmpty && passwordCtrlr.text.isNotEmpty;
  }

  void loggingin() async {
    if (validate()) {
      isLoading.value = !isLoading.value;
      await Repository().login(
        usernameCtrlr.text,
        passwordCtrlr.text
      ).then((user) async {
        isLoading.value = !isLoading.value;
        await SharedAccount.instance.set(user);
        Get.offNamed(Routes.HOME);
      }, onError: (error) {
        isLoading.value = !isLoading.value;
        Get.snackbar(
          margin: EdgeInsets.all(16),
          backgroundColor: Colors.red[100],
          icon: Icon(Icons.error),
          "ERROR", error.toString()
        );
      });
    } else {
      Get.snackbar(
          margin: EdgeInsets.all(16),
          backgroundColor: Colors.red[100],
          icon: Icon(Icons.error),
          "Not Allowed!", "Required fields should not be empty!",
        );
    }
  }
}
