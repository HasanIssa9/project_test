import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_and_shop/modules/module_favorite.dart';
import 'package:stop_and_shop/shared/components/components.dart';
import '../../Services/local_database/shared_preferences.dart';
import '../../style/colors.dart';
import '../CheckScreens/login.dart';
import '../CheckScreens/register.dart';
import '../HomeScreen/build_containers.dart';
import '../Details/details.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 20,
          title: TitleName(title: 'المفضلة'),
        ),
        body: (Database.prefs.getString('fullName')!.isNotEmpty ||
                Database.prefs.getString('email')!.isNotEmpty)
            ? Obx(() {
                return (FavoriteModule.favorites.isEmpty == false)
                    ? Container(
                        width: double.infinity,
                        // padding: const EdgeInsets.all(10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              // ------------------------------- List the product ---------------------------------

                              Expanded(
                                  child: Container(
                                width: double.infinity,
                                child: Obx(() {
                                  return GridView.count(
                                    crossAxisCount: 2,
                                    children: FavoriteModule.favorites
                                        .map((e) => GestureDetector(
                                            onTap: () {
                                              Get.to(Details(
                                                product: e.product,
                                              ));
                                              e.product.isEdit.value = false;
                                            },
                                            child: BuildItem(
                                              imageUrl: e.imageProduct.value,
                                              nameProduct: e.nameProduct.value,
                                              categoryProduct:
                                                  e.categoryProduct.value,
                                              price: e.priceProduct.value,
                                              product: e.product,
                                            )))
                                        .toList(),
                                  );
                                }),
                              ))
                            ]),
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.favorite_border,
                              color: Colors.grey,
                              size: 100,
                            ),
                            Text(
                              'لايوجد منتجات في المفضلة',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 30),
                            )
                          ],
                        ),
                      );
              })
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
      ),
    );
  }
}
