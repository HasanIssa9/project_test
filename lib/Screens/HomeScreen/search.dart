import 'package:flutter/material.dart';
import 'package:stop_and_shop/modules/module_product.dart';

import '../../style/colors.dart';

class Search extends StatelessWidget {
  Search({
    Key? key,
  }) : super(key: key);

  final TextEditingController search=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15 ),
      margin: const EdgeInsets.symmetric(horizontal: 10 ),
      decoration: BoxDecoration(
          color: greenColor, borderRadius: BorderRadius.circular(16)),
      child: TextField(
        controller: search,
        onChanged: (value){
          Product.search.value = search.text;
          (Product.isSearch.value == true)
              ? Product.isSearch.value = false
              : Product.isSearchChanged();
          // Product.search.value='';
        },
        decoration:  InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                Product.search.value=search.text;
                (Product.isSearch.value == true)
                    ? Product.isSearch.value = false
                    : Product.isSearchChanged();
                // Product.search.value='';
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              )),
          hintText: 'ابحث عن منتج',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
