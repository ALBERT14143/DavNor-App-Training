import 'package:davnor_get/app/extras/app_assets.dart';
import 'package:davnor_get/app/modules/login/widgets/login_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xff1f2f3c),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: size.height * 0.3),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(AppAssets.fmisBg), fit: BoxFit.cover)
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color(0xff1f2f3c),
                        Color(0xff466a88).withOpacity(0.5)
                      ],
                    )
                  ),
                )
              ],
            ),
          ),

          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(AppAssets.hrisLogo))
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "DAVNOR APPS WORKS FOR YOU",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 1
                    ),
                  ),
                  SizedBox(height: size.height * 0.08),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        LoginTextfield(
                          label: "Username",
                          controller: controller.usernameCtrlr,
                        ),
                        LoginTextfield(
                          label: "Password", 
                          controller: controller.passwordCtrlr,
                          obscureText: true,
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff28abe1),
                                
                            padding: EdgeInsets.symmetric(vertical: 12),
                                
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                            )
                          ),
                          onPressed: (){
                            FocusScope.of(context).unfocus();
                            controller.loggingin();
                          }, 
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 18
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Obx(() {
              return Visibility(
                visible: controller.isLoading.value,
                child: Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                    child: Center(
                      child: SpinKitCircle(
                        color: Colors.white,
                      ),
                      // child: CircularProgressIndicator(
                      //   color: Colors.white,
                      // ),
                    ),
                  ),
                ),
              );
            }
          )
        ],
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('LoginView'),
    //     centerTitle: true,
    //   ),
    //   body: Stack(
    //     children: [
    //       Column(
    //         children: [
    //           Expanded(
    //             flex: 40,
    //             child: Container(
    //               width: double.infinity,
    //               color: Colors.orange,
    //               child: Center(
    //                 child: CircularProgressIndicator(),
    //               ),
    //             ),
    //           ),
    //           Expanded(
    //             flex: 50,
    //             child: SingleChildScrollView(
    //               child: Container(
    //                 padding: EdgeInsets.all(16),
    //                 width: double.infinity,
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.stretch,
    //                   children: [
    //                     LoginTextfield(
    //                       label: "Username",
    //                       controller: controller.usernameCtrlr,
    //                     ),
    //                     SizedBox(height: 16),
    //                     LoginTextfield(
    //                       label: "Password", 
    //                       controller: controller.passwordCtrlr,
    //                       obscureText: true,
    //                     ),
    //                     SizedBox(height: 16),
    //                     ElevatedButton(
    //                       style: ElevatedButton.styleFrom(
    //                         backgroundColor: Colors.green,
                  
    //                         padding: EdgeInsets.symmetric(vertical: 24),
                  
    //                         shape: RoundedRectangleBorder(
    //                           borderRadius: BorderRadius.circular(16)
    //                         )
    //                       ),
    //                       onPressed: (){
    //                         controller.loggingin();
    //                       }, 
    //                       child: Text(
    //                         "LOGIN",
    //                         style: TextStyle(
    //                           fontWeight: FontWeight.w600,
    //                           color: Colors.white,
    //                           fontSize: 24
    //                         ),
    //                       )
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //       Obx(() {
    //           return Visibility(
    //             visible: controller.isLoading.value,
    //             child: Positioned.fill(
    //               child: Container(
    //                 color: Colors.black.withOpacity(0.6),
    //                 child: Center(
    //                   child: CircularProgressIndicator(
    //                     color: Colors.white,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           );
    //         }
    //       )
    //     ],
    //   )
    // );
  }
}
