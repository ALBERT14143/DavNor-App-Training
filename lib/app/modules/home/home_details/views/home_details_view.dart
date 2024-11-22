import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_details_controller.dart';

class HomeDetailsView extends GetView<HomeDetailsController> {
  const HomeDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeDetailsView'),
        centerTitle: true,
      ),
      body: Card(
        child: ListTile(
          leading: Icon(Icons.check),
          title: Text(controller.selectedEmployee2.firstName ?? "N/A"),
          subtitle: Text(controller.selectedEmployee2.sex ?? "N/A"),
          trailing: Icon(Icons.person),
          onTap: () {
          },
        )
      )
    );
  }
}
