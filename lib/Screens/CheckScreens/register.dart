import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_and_shop/Services/auth_service/auth.dart';
import 'package:stop_and_shop/shared/components/components.dart';

import '../../modules/module_user.dart';
import '../../style/colors.dart';
import 'contents.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordtwo = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BuildLogo(text: 'تسجيل'),
                  Container(
                    width: 270,
                    height: 120,
                    margin: const EdgeInsets.all(25),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/images/img_2.png'),
                      fit: BoxFit.scaleDown,
                    )),
                  ),
                  MainContainer(
                    height: 380,
                    child: Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              ContainerDesign(
                                  color: Colors.white,
                                  child: MyTextField(
                                    label: 'الاسم الكامل',
                                    controller: fullName,
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              // ContainerDesgin(
                              //     color: Colors.white,
                              //     child: MyTextField(
                              //       label: 'رقم الهاتف',
                              //       controller: phoneNumber,
                              //     )),
                              // const SizedBox(
                              //   height: 20,
                              // ),
                              ContainerDesign(
                                color: Colors.white,
                                child: MyEmailField(
                                  label: 'البريد الالكتروني (اختياري)',
                                  controller: email,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ContainerDesign(
                                color: Colors.white,
                                child: MyPasswordField(
                                  label: 'كلمة السر',
                                  controller: password,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ContainerDesign(
                                color: Colors.white,
                                child: MyPasswordField(
                                  label: 'تأكيد كلمة السر ',
                                  controller: passwordtwo,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 50,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: greenColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    // if (password == passwordtwo) {
                                    passs = passwordtwo.text;
                                    or = true;
                                    if (_formKey.currentState!.validate() ||
                                        email == "") {
                                      print("its okay ");
                                      AuthService.signUp(
                                        fullName: fullName.text,
                                        email: email.text,
                                        password: password.text,
                                        phoneNumber: phoneNumber.text,
                                      );
                                      User.add(
                                        email.text,
                                        password.text,
                                        fullName.text,
                                        phoneNumber.text,
                                      );
                                    }
                                    // }
                                  },
                                  child: const Text(
                                    'تسجيل',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'اذا عندك حساب ؟',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(Login());
                              },
                              child: Text(
                                'تسجيل الدخول',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: greenColor,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Align(
                alignment: Alignment.topCenter,
                child: ListTile(
                  leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
