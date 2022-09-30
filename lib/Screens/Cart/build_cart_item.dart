import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_and_shop/Screens/Details/details.dart';
import 'package:stop_and_shop/modules/module_product.dart';

import '../../modules/module_cart.dart';
import '../../style/colors.dart';

class BuildCartItem extends StatelessWidget {
  BuildCartItem(
      {Key? key,
      required this.nameProduct,
      required this.weightProduct,
      required this.imageUrl,
      required this.price,
      required this.product})
      : super(key: key);

  final String nameProduct;
  final double weightProduct;
  final String imageUrl;
  final String price;
  Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(117, 0, 0, 0),
                spreadRadius: 0.6,
                blurRadius: 4,
                offset: Offset(0, 0))
          ]),
      child: Row(
        children: [
          Container(
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(imageUrl),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameProduct,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  '${int.parse(price) * weightProduct} د.ع ',
                  style: TextStyle(
                      fontSize: 16,
                      color: greenColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '$weightProduct كغم ',
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Get.to(Details(product: product));
                   product.isEditItemCart();
                },
                child: Text(
                  'تعديل',
                  style: TextStyle(
                      color: greenColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  if (product.isCart.value == true) {
                    product.isCart.value = false;
                    CartModule.products
                        .removeWhere((e) => e.nameProduct.value == nameProduct);
                  } else {
                    product.isCartChanged();
                  }
                },
                backgroundColor: Colors.red,
                mini: true,
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
