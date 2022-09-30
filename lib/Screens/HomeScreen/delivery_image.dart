import 'package:flutter/material.dart';

import '../../style/colors.dart';

class DeliveryImage extends StatelessWidget {
  const DeliveryImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 130,
      decoration: BoxDecoration(
          color: greenColor,
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
         Expanded(
          flex: 1,
          child:  Container(
              width: 180,
              margin: const EdgeInsets.only(left: 15),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/img_5.png'))),
            ),

          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'التوصيل في نفس اليوم!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold , color: Colors.white) ,
                ),
                Text(
                  'عضوي ومختارة بعناية',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold , color: Colors.white),
                ),
              ],
            ),
          )
        
        
        
        
        ]
        
        ,
      ),
    );
  }
}