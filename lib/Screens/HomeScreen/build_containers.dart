import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_and_shop/modules/module_product.dart';

import '../../modules/module_favorite.dart';

class BuildItem extends StatelessWidget {
  const BuildItem({
    Key? key,
    required this.nameProduct,
    required this.categoryProduct,
    required this.imageUrl,
    required this.price,
    required this.product,
  }) : super(key: key);
  final String nameProduct;
  final String categoryProduct;
  final String imageUrl;
  final String price;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 130,
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
      child: Column(
        children: [
          Container(
            height: 85,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16)),
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage(imageUrl))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nameProduct,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    Text(
                      categoryProduct,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '$price د.ع ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  height: 90,
                  alignment: Alignment.bottomCenter,
                  child: Obx( () {
                      return IconButton(
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
                                ));
                    }
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BuildCategory extends StatelessWidget {
  const BuildCategory({Key? key, required this.image, required this.name})
      : super(key: key);
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(left: 13, right: 3),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(117, 0, 0, 0),
            spreadRadius: 0.6,
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(image),
              ),
            ),
          ),
          Text(
            name,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          )
        ],
      ),
    );
  }
}
