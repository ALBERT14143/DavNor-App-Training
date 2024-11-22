import 'package:davnor_get/app/data/shared/shared_account.dart';
import 'package:davnor_get/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(Duration(seconds: 2));
    var valid = await SharedAccount.instance.check();
    Get.offNamed(valid ? Routes.HOME : Routes.LOGIN);
    super.onInit();
  }
}
