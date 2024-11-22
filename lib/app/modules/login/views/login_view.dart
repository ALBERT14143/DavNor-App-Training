import 'package:davnor_get/app/modules/login/widgets/login_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 40,
                child: Container(
                  width: double.infinity,
                  color: Colors.orange,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              Expanded(
                flex: 50,
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        LoginTextfield(
                          label: "Username",
                          controller: controller.usernameCtrlr,
                        ),
                        SizedBox(height: 16),
                        LoginTextfield(
                          label: "Password", 
                          controller: controller.passwordCtrlr,
                          obscureText: true,
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                  
                            padding: EdgeInsets.symmetric(vertical: 24),
                  
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)
                            )
                          ),
                          onPressed: (){
                            controller.loggingin();
                          }, 
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 24
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Obx(() {
              return Visibility(
                visible: controller.isLoading.value,
                child: Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            }
          )
        ],
      )
    );
  }
}
