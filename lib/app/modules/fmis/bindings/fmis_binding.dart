import 'package:get/get.dart';

import '../controllers/fmis_controller.dart';

class FmisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FmisController>(
      () => FmisController(),
    );
  }
}
