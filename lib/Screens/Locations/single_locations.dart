import 'package:flutter/material.dart';

import 'package:stop_and_shop/modules/module_location.dart';
import 'package:stop_and_shop/style/colors.dart';

class BuildSingleLocations extends StatelessWidget {
  const BuildSingleLocations({
    Key? key,
    required this.nameLocation,
    required this.nameCity,
    required this.nameTown,
    required this.namePoint,
    required this.phoneNumber,
  }) : super(key: key);

  final String nameLocation;
  final String nameCity;
  final String nameTown;
  final String namePoint;
  final String phoneNumber;
  // final bool valid;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: greenColor, width: 1, style: BorderStyle.solid)),
        child: ListTile(
          title: Row(
            children: [
              Text(
                nameLocation,
                style: TextStyle(
                    color: greenColor, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 25,),
              Text(
                phoneNumber,
                style: TextStyle(
                    color: greenColor, fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          subtitle: Text(
            '$nameCity , $nameTown , $namePoint ',
            style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
          ),
          trailing: FloatingActionButton(
            onPressed: () {
              LocationModule.locations
                  .removeWhere((e) => e.nameLocation.value == nameLocation);
            },
            mini: true,
            backgroundColor: Colors.red,
            child: const Icon(
              Icons.remove,
            ),
          ),
        ),
      ),
    );
  }
}
