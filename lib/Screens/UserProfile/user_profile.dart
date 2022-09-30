import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_and_shop/Screens/Locations/locations.dart';
import 'package:stop_and_shop/Services/auth_service/auth.dart';
import 'package:stop_and_shop/style/colors.dart';
import '../../Services/local_database/shared_preferences.dart';
import '../../modules/module_user.dart';
import '../../shared/components/components.dart';
import '../CheckScreens/contents.dart';
import '../CheckScreens/login.dart';
import '../CheckScreens/register.dart';

class UserProfile extends StatefulWidget {
  UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final TextEditingController fullName =
      TextEditingController(text: Database.prefs.getString('fullName'));
  final TextEditingController email =
      TextEditingController(text: Database.prefs.getString('email'));
  final TextEditingController phoneNumber =
      TextEditingController(text: Database.prefs.getString('phoneNumber'));

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: TitleName(title: 'الملف الشخصي'),
          ),
          body: (Database.prefs.getString('fullName')!.isNotEmpty ||
                  Database.prefs.getString('email')!.isNotEmpty)
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'اهلا ,${Database.prefs.getString('fullName')} ',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              phoneNumber.text,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              '${Database.prefs.getString('email')}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: const Icon(
                                Icons.person,
                                size: 35,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: TextButton(
                                onPressed: () {
                                  final alertAddName = Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: AlertDialog(
                                        title: const Text('تعديل معلوماتي'),
                                        content: SizedBox(
                                          height: 250,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Divider(
                                                color: Colors.black,
                                                height: 5,
                                              ),
                                              ContainerDesign(
                                                color: Colors.white,
                                                child: MyTextField(
                                                    label: 'الاسم الكامل',
                                                    controller: fullName),
                                              ),
                                              ContainerDesign(
                                                color: Colors.white,
                                                child: MyTextField(
                                                  label: 'البريد الالكتروني',
                                                  controller: email,
                                                ),
                                              ),
                                              ContainerDesign(
                                                color: Colors.white,
                                                child: MyTextField(
                                                    label: 'رقم الهاتف',
                                                    controller: phoneNumber),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Database.prefs.setString(
                                                      'fullName',
                                                      fullName.text);
                                                  Database.prefs.setString(
                                                      'email', email.text);
                                                  Database.prefs.setString(
                                                      'phoneNumber',
                                                      phoneNumber.text);

                                                  setState(() {});
                                                  Get.back();
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10,
                                                      vertical: 3),
                                                  decoration: BoxDecoration(
                                                      color: greenColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: const [
                                                      Text(
                                                        'حفظ التغيرات',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Icon(
                                                        Icons.save,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ));
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext ctx) {
                                        return alertAddName;
                                      });
                                },
                                child: Text(
                                  'تعديل',
                                  style: TextStyle(color: greenColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(Locations());
                            },
                            child: Row(
                              children: const [
                                Icon(Icons.location_pin),
                                SizedBox(width: 10),
                                Text("مواقعي")
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            child: Row(
                              children: const [
                                Icon(Icons.chat),
                                SizedBox(width: 10),
                                Text("تواصل معنا")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Spacer(),
                          TextButton(
                              onPressed: () {
                                AuthService.signOut();
                              },
                              child: Row(
                                children: const [
                                  Icon(Icons.logout, color: Colors.red),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "تسجيل الخروج",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 17),
                                  )
                                ],
                              ))
                        ])
                  ]),
                )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ContainerDesign(
                          color: greenColor,
                          child: TextButton(
                            onPressed: () {
                              Get.to(Login());
                            },
                            child: const Text(
                              'تسجيل الدخول',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ContainerDesign(
                          color: greenColor,
                          child: TextButton(
                            onPressed: () {
                              Get.to(Signup());
                            },
                            child: const Text(
                              'تسجيل',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
