import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_and_shop/Screens/CheckOutScreen/check_out.dart';
import 'package:stop_and_shop/Screens/CheckScreens/login.dart';
import 'package:stop_and_shop/Screens/CheckScreens/register.dart';
import 'package:stop_and_shop/modules/module_cart.dart';
import 'package:stop_and_shop/modules/module_favorite.dart';
import 'package:stop_and_shop/modules/module_product.dart';
import 'package:stop_and_shop/style/colors.dart';
import '../../shared/components/components.dart';
import '../HomeScreen/search.dart';
import 'build_cart_item.dart';
import 'package:stop_and_shop/Services/local_database/shared_preferences.dart';

class Cart extends StatelessWidget {
  Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: TitleName(title: 'سلتي'),
          titleSpacing: 20,
          actions: (Database.prefs.getString('fullName')!.isNotEmpty ||
                  Database.prefs.getString('email')!.isNotEmpty)
              ? [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(16)),
                      child: TextButton(
                        onPressed: () {
                          if (!CartModule.products.isEmpty) {
                            Get.to(const CheckOut());
                          }
                        },
                        child: const Text(
                          'الدفع',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  )
                ]
              : null,
        ),
        body: (Database.prefs.getString('fullName')!.isNotEmpty ||
                Database.prefs.getString('email')!.isNotEmpty)
            ? Obx(() {
                return (CartModule.products.isEmpty == false)
                    ? Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            // ------------------------------- List the product ---------------------------------
                            Expanded(
                              child: Stack(
                                children: [
                                  Obx(() {
                                    return ListView(
                                      children: CartModule.products
                                          .map(
                                            (e) => BuildCartItem(
                                              product: e.product,
                                              nameProduct: e.nameProduct.value,
                                              weightProduct:
                                                  e.weightProduct.value,
                                              imageUrl: e.imageProduct.value,
                                              price: e.priceProduct.value,
                                            ),
                                          )
                                          .toList(),
                                    );
                                  }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.grey,
                              size: 100,
                            ),
                            Text(
                              'لايوجد منتجات في سلتي',
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
