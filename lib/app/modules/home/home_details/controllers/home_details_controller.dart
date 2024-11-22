import 'package:davnor_get/app/data/model/employee.dart';
import 'package:get/get.dart';

class HomeDetailsController extends GetxController {
  late Employee selectedEmployee2;

  @override
  void onInit() {
    selectedEmployee2 = Get.arguments as Employee;
    super.onInit();
  }
}
