import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/fmis_controller.dart';

class FmisView extends GetView<FmisController> {
  const FmisView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FmisView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FmisView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
