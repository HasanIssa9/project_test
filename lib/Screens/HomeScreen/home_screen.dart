 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_and_shop/Screens/Categories/categories.dart';
import 'package:stop_and_shop/Screens/HomeScreen/search.dart';
import '../../modules/module_product.dart';
import '../../modules/module_category.dart';
import '../../shared/components/components.dart';
import 'build_containers.dart';
import 'delivery_image.dart';
import 'package:stop_and_shop/Screens/Details/details.dart';
import 'package:stop_and_shop/Services/local_database/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, 
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "STOP & SHOP STORE",

            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          // padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(margin:  EdgeInsets.symmetric(horizontal: 10 ),
                child: Text(
                'مرحبا ${Database.prefs.getString('fullName')}',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: const Text(
                'ابحث عن الطعام الطازج وقتما تشاء',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              ),
              ),
              // --------------------------box search----------------------------
              Search(),
              const SizedBox(
                height: 20,
              ),


              Expanded(
                child: Obx(() {
                  return ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: (Product.isSearch.value == false)
                        ? [
                            const DeliveryImage(),
                            // -------------------------first section--------------------------
                            Container(
                              margin:EdgeInsets.symmetric(horizontal: 10)  ,
                              child:Row(
                              children: [TitleName(title: 'الفئات')],
                            ),
                            ),
                            SizedBox(
                              height: 110,
                              child: ListView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                children: Category.categories
                                    .map(
                                      (e) => GestureDetector(
                                        onTap: () {
                                          Get.to(Categories(
                                            category: e,
                                          ));
                                        },
                                        child: BuildCategory(
                                          name: e.name,
                                          image: e.image,
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [TitleName(title: 'افضل المنتجات')],
                              ),
                            ),
                            SizedBox(
                              height: 195,
                              child: Obx(() {
                                return ListView(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  children: Product.products
                                      .map((e) => GestureDetector(
                                            onTap: () {
                                              Get.to(Details(product: e));
                                              e.isEdit.value = false;
                                            },
                                            child: BuildItem(
                                              imageUrl: e.image.value,
                                              nameProduct: e.name.value,
                                              categoryProduct:
                                                  e.category.value,
                                              price: e.price.value,
                                              product: e,
                                            ),
                                          ))
                                      .toList(),
                                );
                              }),
                            ),

                            Container(
                              margin:EdgeInsets.symmetric(horizontal: 10)  ,
                              child:Row(
                              children: [TitleName(title: 'منتجات عليها خصم')],
                            ),
                            ),
                            SizedBox(
                              height: 195,
                              child: Obx(() {
                                return ListView(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  children: Product.products
                                      .map((e) => GestureDetector(
                                            onTap: () {
                                              Get.to(Details(
                                                product: e,
                                              ));
                                              e.isEdit.value = false;
                                            },
                                            child: BuildItem(
                                              imageUrl: e.image.value,
                                              nameProduct: e.name.value,
                                              categoryProduct:
                                                  e.category.value,
                                              price: e.price.value,
                                              product: e,
                                            ),
                                          ))
                                      .toList(),
                                );
                              }),
                            ),
                          ]
                        : [
                            Wrap(
                              alignment: WrapAlignment.center,
                              children: Product.products
                                  .where((e) =>
                                      e.name.value
                                          .contains(Product.search) ==
                                      true)
                                  .map((e) => GestureDetector(
                                      onTap: () {
                                        Get.to(Details(
                                          product: e,
                                        ));
                                        e.isEdit.value = false;
                                      },
                                      child: BuildItem(
                                        imageUrl: e.image.value,
                                        nameProduct: e.name.value,
                                        categoryProduct:
                                            e.category.value,
                                        price: e.price.value,
                                        product: e,
                                      )))
                                  .toList(),
                            )
                          ],
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
