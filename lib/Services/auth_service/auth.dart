import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:stop_and_shop/Screens/AllScreen/AllScreen.dart';
import 'package:stop_and_shop/Screens/FirstScreen/first_screen.dart';
import '../local_database/shared_preferences.dart';

class AuthService {
  static RxBool isBusy = false.obs;

  static signIn({required String email, required String password}) async {
    isBusy.value = true;
    FocusScope.of(Get.context!).unfocus();
    try {
      Database.prefs.setString('email', email);
      Database.prefs.setString('password', password);
      Get.offAll(const AllScreen());
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: 'خطأ',
        message: e.toString().substring(0, min(30, e.toString().length)),
        duration: const Duration(seconds: 3),
      ));
    }
    isBusy.value = false;
  }

  static signUp(
      {required String fullName,
      String? email,
      required String password,
      required String phoneNumber}) async {
    isBusy.value = true;
    FocusScope.of(Get.context!).unfocus();
    try {
      Database.prefs.setString('phoneNumber', phoneNumber);
      Database.prefs.setString('fullName', fullName);
      Database.prefs.setString('email', email!);
      Database.prefs.setString('password', password);
      Get.offAll(const AllScreen());
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: 'خطأ',
        message: e.toString().substring(0, min(30, e.toString().length)),
        duration: const Duration(seconds: 3),
      ));
    }
    isBusy.value = false;
  }

  static signOut() {
    Database.prefs.remove('email');
    Database.prefs.remove('password');
    Get.offAll(const FirstScreen());
  }
}
