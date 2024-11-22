import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/payslip_controller.dart';

class PayslipView extends GetView<PayslipController> {
  const PayslipView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PayslipView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PayslipView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
