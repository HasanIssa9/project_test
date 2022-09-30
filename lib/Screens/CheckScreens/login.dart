import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_and_shop/Screens/CheckScreens/contents.dart';
import 'package:stop_and_shop/Screens/CheckScreens/register.dart';
import 'package:stop_and_shop/Services/auth_service/auth.dart';
import 'package:stop_and_shop/shared/components/components.dart';
import 'package:stop_and_shop/style/colors.dart';
import 'contents.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
                  BuildLogo(text: 'تسجيل الدخول'),
                  MainContainer(
                    height: 550,
                    child: Column(
                      children: [
                        Container(
                          width: 270,
                          height: 200,
                          margin: const EdgeInsets.all(25),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/images/img_4.png'),
                            fit: BoxFit.scaleDown,
                          )),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              ContainerDesign(
                                  color: Colors.white,
                                  child: MyTextField(
                                    label: "البريد الالكتروني او اسم المستخدم ",
                                    controller: email,
                                  )),
                              const SizedBox(
                                height: 25,
                              ),
                              ContainerDesign(
                                  color: Colors.white,
                                  child: MyPasswordField(
                                    label: 'كلمة السر',
                                    controller: password,
                                  )),
                              const SizedBox(
                                height: 25,
                              ),
                              ContainerDesign(
                                  color: greenColor,
                                  child: TextButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        AuthService.signIn(
                                            email: email.text,
                                            password: password.text);
                                      }
                                    },
                                    child: const Text(
                                      'تسجيل الدخول',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'اذا لم يكون لديك حساب ؟',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(Signup());
                                },
                                child: Text(
                                  'سجل بحساب جديد',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: greenColor,
                                  ),
                                ))
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
