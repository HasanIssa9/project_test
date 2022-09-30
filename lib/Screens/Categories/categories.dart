import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_and_shop/Screens/HomeScreen/build_containers.dart';
import 'package:stop_and_shop/Screens/HomeScreen/search.dart';
import 'package:stop_and_shop/modules/module_product.dart';

import '../../modules/module_category.dart';
import '../Details/details.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            category.name,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Search(),
              const SizedBox(
                height: 15,
              ),
              // ------------------------------- List the product ---------------------------------
              Expanded(
                child: Obx(() {
                  return (Product.products
                      .where((e) => e.category.value == category.name)
                      .isEmpty ==
                      false)
                      ? ListView(
                    children: (Product.isSearch.value == false)
                        ? [
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: Product.products
                            .where((e) =>
                        e.category.value == category.name)
                            .map((e) => GestureDetector(
                            onTap: () {
                              Get.to(Details(
                                product: e,
                              ));
                            },
                            child: BuildItem(
                              imageUrl: e.image.value,
                              nameProduct: e.name.value,
                              categoryProduct: e.category.value,
                              price: e.price.value,
                              product: e,
                            )))
                            .toList(),
                      )
                    ]
                        : [
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: Product.products
                            .where((e) =>
                        e.category.value == category.name &&
                            e.name.value
                                .contains(Product.search) ==
                                true)
                            .map((e) => GestureDetector(
                            onTap: () {
                              Get.to(Details(
                                product: e,
                              ));
                            },
                            child: BuildItem(
                              imageUrl: e.image.value,
                              nameProduct: e.name.value,
                              categoryProduct: e.category.value,
                              price: e.price.value,
                              product: e,
                            )))
                            .toList(),
                      )
                    ],
                  )
                      : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.hourglass_empty,
                          color: Colors.grey,
                          size: 100,
                        ),
                        Text(
                          'لايوجد منتجات من هذه الفئة',
                          style:
                          TextStyle(color: Colors.grey, fontSize: 30),
                        )
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
