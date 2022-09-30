import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stop_and_shop/Screens/CheckOutScreen/check_out.dart';
import 'package:stop_and_shop/Screens/CheckScreens/contents.dart';
import 'package:stop_and_shop/modules/module_location.dart';
import '../../shared/components/components.dart';
import 'single_locations.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:stop_and_shop/style/colors.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class Locations extends StatelessWidget {
  Locations({Key? key}) : super(key: key);

  var cl;

  Future<Position> getLatandlong() async {
    return await Geolocator.getCurrentPosition().then((value) => value);
  }

  final TextEditingController nameLocation = TextEditingController();
  final TextEditingController nameCity = TextEditingController();
  final TextEditingController nameTown = TextEditingController();
  final TextEditingController namePoint = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();

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
          titleSpacing: 10,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: const Text(
            "المواقع الخاصة بي ",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "اختر احد مواقعك ",
                style: TextStyle(
                    color: greenColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Expanded(child: Obx(() {
                return ListView(
                  children: LocationModule.locations
                      .map(
                        (e) => BuildSingleLocations(
                            nameLocation: e.nameLocation.value,
                            nameCity: e.nameCity.value,
                            nameTown: e.nameTown.value,
                            namePoint: e.namePoint.value,
                            phoneNumber: e.phoneNumber.value),
                      ).toList(),
                );
              })),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "_____________________ او  ___________________",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(130)),
                    child: TextButton(
                        onPressed: () {
                          final alertAddName = Directionality(
                              textDirection: TextDirection.rtl,
                              child: AlertDialog(
                                title: const Text(' حدد موقعك '),
                                content: SizedBox(
                                  height: 300,
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
                                            label: 'اسم الموقع',
                                            controller: nameLocation),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ContainerDesign(
                                        color: Colors.white,
                                        child: MyTextField(
                                            label: 'رقم الهاتف ',
                                            controller: phoneNumber),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          cl = await getLatandlong();
                                          List<Placemark> placemarks =
                                              await placemarkFromCoordinates(
                                                  cl.latitude, cl.longitude);
                                          print(placemarks[0]);
                                          Future getPostion() async {
                                            bool services;
                                            LocationPermission per;
                                            services = await Geolocator
                                                .isLocationServiceEnabled();
                                            print(services);
                                            if (services == false) {
                                              AwesomeDialog(
                                                  context: context,
                                                  title: "Services",
                                                  body: const Text(
                                                      "خدمة الموقع غير مفعلة "))
                                                .show();
                                            }
                                            per = await Geolocator
                                                .checkPermission();
                                            if (per ==
                                                LocationPermission.denied) {
                                              per = await Geolocator
                                                  .requestPermission();
                                            }
                                            if (per ==
                                                LocationPermission.always) {
                                              LocationModule.add(
                                                  nameLocation.text,
                                                  placemarks[0]
                                                      .administrativeArea!,
                                                  placemarks[0].locality!,
                                                  placemarks[0].street!,
                                                  phoneNumber.text,
                                                  false,
                                                  cl.latitude,
                                                  cl.longitude);
                                              Get.back();
                                            }
                                            if (per ==
                                                LocationPermission.whileInUse) {
                                              LocationModule.add(
                                                  nameLocation.text,
                                                  placemarks[0]
                                                      .administrativeArea!,
                                                  placemarks[0].locality!,
                                                  placemarks[0].street!,
                                                  phoneNumber.text,
                                                  false,
                                                  cl.latitude,
                                                  cl.longitude);
                                              Get.back();
                                            }
                                          }

                                          getPostion();
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 3),
                                          decoration: BoxDecoration(
                                              color: greenColor,
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: const [
                                              Text(
                                                'تحديد الموقع ',
                                                style: TextStyle(
                                                    color: Colors.white),
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
                        child: const Text(
                          " اضف موقعك من الخريطة",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        )),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                        color: greenColor,
                        borderRadius: BorderRadius.circular(130)),
                    child: TextButton(
                        onPressed: () {
                          final alertAddName = Directionality(
                              textDirection: TextDirection.rtl,
                              child: AlertDialog(
                                title: const Text('اضافة موقع جديد'),
                                content: SizedBox(
                                  height: 400,
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
                                            label: 'اسم الموقع',
                                            controller: nameLocation),
                                      ),
                                      ContainerDesign(
                                        color: Colors.white,
                                        child: MyTextField(
                                            label: "اسم المدينة ",
                                            controller: nameCity),
                                      ),
                                      ContainerDesign(
                                        color: Colors.white,
                                        child: MyTextField(
                                            label: 'اسم المنطقة ',
                                            controller: nameTown),
                                      ),
                                      ContainerDesign(
                                        color: Colors.white,
                                        child: MyTextField(
                                            label: 'اقرب نقطة دالة',
                                            controller: namePoint),
                                      ),
                                      ContainerDesign(
                                        color: Colors.white,
                                        child: MyTextField(
                                            label: 'رقم الهاتف',
                                            controller: phoneNumber),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          LocationModule.add(
                                              nameLocation.text,
                                              nameCity.text,
                                              nameTown.text,
                                              namePoint.text,
                                              phoneNumber.text,
                                              false,
                                              0.0,
                                              0.0);
                                          Get.back();
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 3),
                                          decoration: BoxDecoration(
                                              color: greenColor,
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: const [
                                              Text(
                                                'حفظ الموقع',
                                                style: TextStyle(
                                                    color: Colors.white),
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
                        child: const Text(
                          "اضف الموقع جديد",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
