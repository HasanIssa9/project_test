import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_and_shop/modules/module_cart.dart';
import 'package:stop_and_shop/modules/module_favorite.dart';
import 'package:stop_and_shop/style/colors.dart';
import 'package:stop_and_shop/Screens/HomeScreen/build_containers.dart';

import 'package:stop_and_shop/modules/module_product.dart';

import '../../shared/components/components.dart';
import 'details.dart';

class Details1 extends StatelessWidget {
  const Details1({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Obx(() {
            return Column(
              children: [
                // --------------------- image ---------------
                Stack(
                  children: [
                    Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(product.image.value))),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: ListTile(
                          leading: TextButton(
                              onPressed: () {
                                Get.back();
                                (product.isCart.value == true)
                                    ? CartModule.update(
                                        product.name.value,
                                        product.image.value,
                                        product.weight.value,
                                        product.price.value.toString(),
                                      )
                                    : null;
                              },
                              child: (product.isEdit.value == false)
                                  ? IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: const Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.black,
                                      ),
                                    )
                                  : Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      decoration: BoxDecoration(
                                          color: greenColor,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: const Text(
                                        'حفظ',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    )),
                          trailing: IconButton(
                              onPressed: () {
                                if (product.isFavorite.value == true) {
                                  product.isFavorite.value = false;
                                  FavoriteModule.favorites.removeWhere((e) =>
                                      e.nameProduct.value ==
                                      product.name.value);
                                } else {
                                  product.isFavoriteChanged();
                                  FavoriteModule.add(
                                    product.name.value,
                                    product.image.value,
                                    product.category.value,
                                    product.price.value,
                                  );
                                }
                              },
                              icon: (product.isFavorite.value == false)
                                  ? const Icon(
                                      Icons.favorite_border,
                                      size: 25,
                                    )
                                  : const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 25,
                                    )),
                        ),
                      ),
                    )
                  ],
                ),
                // --------------------details ---------------

                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        height: 500,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleName(title: product.name.value),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 3),
                                    decoration: BoxDecoration(
                                        color: greenColor,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Text(
                                      '${product.price.value} د.ع',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Row(
                                  children: [
                                    FloatingActionButton(
                                        onPressed: () {
                                          product.weight.value += 0.5;
                                        },
                                        heroTag: 'btn1',
                                        backgroundColor: greenColor,
                                        mini: true,
                                        child: const Icon(Icons.add)),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child:
                                          Text('${product.weight.value}   كغم'),
                                    ),
                                    FloatingActionButton(
                                        onPressed: () {
                                          (product.weight.value <= 0.5)
                                              ? product.weight.value = 0.5
                                              : product.weight.value -= 0.5;
                                        },
                                        heroTag: 'btn2',
                                        backgroundColor: Colors.grey,
                                        mini: true,
                                        child: const Icon(Icons.remove)),
                                  ],
                                )
                              ],
                            ),
                            TitleName(title: 'الوصف'),
                            SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Container(
                                height: 100,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16)),
                                child: Text(
                                  product.description.value,
                                  style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            TitleName(title: 'منتجات مماثلة'),
                            SizedBox(
                              height: 195,
                              child: Obx(
                                () {
                                  return ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: Product.products
                                        .where((e) =>
                                            e.category.value ==
                                            product.category.value)
                                        .map(
                                          (e) => GestureDetector(
                                            onTap: () {
                                              Get.to(Details(
                                                product: e,
                                              ));
                                              e.isEdit.value = false;
                                            },
                                            child: BuildItem(
                                              imageUrl: e.image.value,
                                              nameProduct: e.name.value,
                                              categoryProduct: e.category.value,
                                              price: e.price.value,
                                              product: e,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          decoration: BoxDecoration(
                              color: greenColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: TextButton(
                            onPressed: () {
                              if (product.isCart.value == true) {
                                product.isCart.value = false;
                                CartModule.products.removeWhere((e) =>
                                    e.nameProduct.value == product.name.value);
                              } else {
                                product.isCartChanged();
                                CartModule.add(
                                  product.name.value,
                                  product.image.value,
                                  product.weight.value,
                                  product.price.value.toString(),
                                );
                              }
                            },
                            child: (product.isCart.value == false)
                                ? const Text(
                                    'اضافة الى سلتي',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )
                                : const Text(
                                    'ازالة من السلة',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          })),
    );
  }
}
