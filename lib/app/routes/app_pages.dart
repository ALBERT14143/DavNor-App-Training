import 'package:get/get.dart';

import '../modules/fmis/bindings/fmis_binding.dart';
import '../modules/fmis/payslip/bindings/payslip_binding.dart';
import '../modules/fmis/payslip/views/payslip_view.dart';
import '../modules/fmis/views/fmis_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/home_details/bindings/home_details_binding.dart';
import '../modules/home/home_details/views/home_details_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.HOME_DETAILS,
          page: () => const HomeDetailsView(),
          binding: HomeDetailsBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.FMIS,
      page: () => const FmisView(),
      binding: FmisBinding(),
      children: [
        GetPage(
          name: _Paths.PAYSLIP,
          page: () => const PayslipView(),
          binding: PayslipBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
