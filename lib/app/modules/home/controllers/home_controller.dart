import 'package:davnor_get/app/data/model/employee.dart';
import 'package:davnor_get/app/data/model/user.dart';
import 'package:davnor_get/app/data/services/repository.dart';
import 'package:davnor_get/app/data/shared/shared_account.dart';
import 'package:davnor_get/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var repository = Repository();
  var fnameCtrlr = TextEditingController();
  var mnameCtrlr = TextEditingController();
  var lnameCtrlr = TextEditingController();
  
  void selectEmployee(Employee emp) {
    Get.toNamed(Routes.HOME_DETAILS, arguments: emp);
  }
  var isAdding = false.obs;
  Future addEmployee() async {
    isAdding.value = true;
    var newEmployee = Employee(
      recNo: 0,
      firstName: fnameCtrlr.text,
      middleName: mnameCtrlr.text,
      lastName: lnameCtrlr.text
    );

    await repository.saveEmployee(newEmployee).then((employee) {
      listOfEmployee.add(employee);
      reset();
      isAdding.value = false;
    }, onError: (error) {
      isAdding.value = false;
      Get.snackbar(
        margin: EdgeInsets.all(16),
        backgroundColor: Colors.red[100],
        icon: Icon(Icons.error),
        "ERROR", error.toString()
      );
    });
  }

  var isDeleting = false.obs;
  void removeEmployee(int index, int recNo) async {
    isDeleting.value = true;
    await Future.delayed(Duration(seconds: 2));
    await repository.removeEmployee(recNo).then((value) {
      isDeleting.value = false;
      listOfEmployee.removeAt(index);
    }, onError: (error) {
      isDeleting.value = false;
      Get.snackbar(
        margin: EdgeInsets.all(16),
        backgroundColor: Colors.red[100],
        icon: Icon(Icons.error),
        "ERROR", error.toString()
      );
    });
  }


  void reset() {
    fnameCtrlr.clear();
    mnameCtrlr.clear();
    lnameCtrlr.clear();
    Get.back();
  }
  var listOfEmployee = <Employee>[].obs;
  Future getEmployee() async {
    await repository.getEmployees().then((employees) {
      listOfEmployee.assignAll(employees);
    }, onError: (error) {
      
    });
  }
  var user = User().obs;
  Future getUser() async {
    user.value = await SharedAccount.instance.get();
  }

  Future logout() async {
    var valid = await SharedAccount.instance.remove();
    if (valid) {
      Get.offNamed(Routes.SPLASH);
    } else {
      Get.snackbar(
        margin: EdgeInsets.all(16),
        backgroundColor: Colors.red[100],
        icon: Icon(Icons.error),
        "FAILED", "Logout not success!"
      );
    }
  }
  
  @override
  void onInit() async {
    await getUser();
    await getEmployee();
    super.onInit();
  }
}
