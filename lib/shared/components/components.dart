import 'package:flutter/material.dart';
import 'package:stop_and_shop/style/colors.dart';

// build the logo for log in
Widget BuildLogo({
  String? text,
}) =>
    Center(
      child: Stack(children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
              color: greenColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(350),
                  bottomRight: Radius.circular(350)),
              image: const DecorationImage(
                  fit: BoxFit.scaleDown,
                  image: AssetImage('assets/images/img_logo.png'))),
        ),
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text ?? '',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
          ]),
        )
      ]),
    );

// --------------------------------------------------------------------------------------------
// build button and text field login and signup
Widget ContainerDesign({
  required Color color,
  required Widget child,
}) =>
    Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: child,
    );

// --------------------------------------------------------------------------------------------------------------------------------------------------
Text TitleName({required String title}) => Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
