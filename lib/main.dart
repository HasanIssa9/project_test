import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stop_and_shop/Screens/SplashScreen/splash_screen.dart';
import 'package:stop_and_shop/Services/local_database/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stop_and_shop/modules/module_product.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  Database.prefs = await SharedPreferences.getInstance();
  Product.isSearch.value = false;
  Product.search.value = '';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}




    

    // const GetMaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: SplashScreen(),
    // );