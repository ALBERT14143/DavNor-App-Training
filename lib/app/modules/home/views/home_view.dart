import 'package:davnor_get/app/modules/login/widgets/login_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
            return Text(controller.user.value.fullnameLast ?? "No Name");
          }
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              controller.logout();
            }, 
            icon: Icon(Icons.logout)
          )
        ],
      ),
      body: Obx(() {
          return Stack(
            children: [
              ListView.builder(
                itemCount: controller.listOfEmployee.length,
                itemBuilder: (context, index) {
                  var employee = controller.listOfEmployee[index];
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.check),
                      title: Text(employee.fullname()),
                      subtitle: Text(employee.sex ?? "N/A"),
                      trailing: IconButton(
                        onPressed: (){
                          controller.removeEmployee(index, employee.recNo!);
                        }, 
                        icon: Icon(Icons.delete, color: Colors.red[400])
                      ),
                      onTap: () {
                        controller.selectEmployee(employee);
                      },
                    )
                  );
                  
                },
              ),
              Visibility(
                visible: controller.isDeleting.value,
                child: Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  ),
                ),
              ),
              // controller.isDeleting.value ? Positioned.fill(
              //   child: Container(
              //     color: Colors.black.withOpacity(0.6),
              //   ),
              // ) : SizedBox()
            ],
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
            context: context, 
            builder: (context) => AddDialog(controller: controller),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddDialog extends StatelessWidget {
  const AddDialog({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Text(
                "Add Employee",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32
                ),
              ),
            ),
            LoginTextfield(
              label: "First Name", 
              controller: controller.fnameCtrlr
            ),
            LoginTextfield(
              label: "Middle Name", 
              controller: controller.mnameCtrlr
            ),
            LoginTextfield(
              label: "Last Name", 
              controller: controller.lnameCtrlr
            ),
            SizedBox(height: 16),
            Obx(() {
                return SizedBox(
                  width: double.infinity,
                  child: !controller.isAdding.value ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(vertical: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                      )
                    ),
                    onPressed: (){
                      controller.addEmployee();
                    }, 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Icon(Icons.add),
                            Text("Test")
                          ],
                        ),
                        Text(
                          "ADD",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 24
                          ),
                        ),
                      ],
                    )
                  ) : Center(child: CircularProgressIndicator()),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
