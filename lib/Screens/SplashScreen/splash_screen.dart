import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_and_shop/Screens/FirstScreen/first_screen.dart';
import 'package:stop_and_shop/style/colors.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../../Services/auth_service/auth.dart';
import '../../Services/local_database/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  login() async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      String? email = Database.prefs.getString('phoneNumber');
      String? password = Database.prefs.getString('password');
      if (email != null && password != null) {
        AuthService.signIn(email: email, password: password);
      } else {
        Get.offAll(FirstScreen());
      }
    } catch (e) {
      Get.offAll(FirstScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    login();
    double cpwidth = double.infinity;
    return Scaffold(
      backgroundColor: greenColor,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(cpwidth, (cpwidth * 2.1875).toDouble()),
              painter: RPSCustomPainter(),
            ),
            AnimatedSplashScreen(
                splash: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/img_logo.png',
                    width: 220,
                    height: 250,
                  ),
                ),
                backgroundColor: const Color.fromRGBO(0, 128, 0, 0),
                nextScreen: const FirstScreen(),
                duration: 900,
                splashIconSize: 250,
                splashTransition: null,
                pageTransitionType: PageTransitionType.fade)
          ],
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.004166699, size.height * 0.6990476);
    path_0.cubicTo(
        size.width * 0.004166667,
        size.height * 0.4668185,
        size.width * 0.004166667,
        size.height * 0.2345893,
        size.width * 0.004166667,
        size.height * 0.002132472);
    path_0.cubicTo(
        size.width * 0.3374996,
        size.height * 0.002132472,
        size.width * 0.6708329,
        size.height * 0.002132472,
        size.width * 1.004167,
        size.height * 0.002132472);
    path_0.cubicTo(
        size.width * 1.004167,
        size.height * 0.04207636,
        size.width * 1.004167,
        size.height * 0.08205026,
        size.width * 1.003681,
        size.height * 0.1236372);
    path_0.cubicTo(
        size.width * 0.9980296,
        size.height * 0.1444500,
        size.width * 0.9928631,
        size.height * 0.1636499,
        size.width * 0.9872409,
        size.height * 0.1834727);
    path_0.cubicTo(
        size.width * 0.9857039,
        size.height * 0.1862260,
        size.width * 0.9846228,
        size.height * 0.1883564,
        size.width * 0.9834670,
        size.height * 0.1911992);
    path_0.cubicTo(
        size.width * 0.9833841,
        size.height * 0.1933391,
        size.width * 0.9833757,
        size.height * 0.1947664,
        size.width * 0.9833149,
        size.height * 0.1968156);
    path_0.cubicTo(
        size.width * 0.9832190,
        size.height * 0.1982671,
        size.width * 0.9831755,
        size.height * 0.1990966,
        size.width * 0.9825288,
        size.height * 0.2006116);
    path_0.cubicTo(
        size.width * 0.9727212,
        size.height * 0.2275310,
        size.width * 0.9635167,
        size.height * 0.2537650,
        size.width * 0.9539154,
        size.height * 0.2807318);
    path_0.cubicTo(
        size.width * 0.9508428,
        size.height * 0.2898274,
        size.width * 0.9481669,
        size.height * 0.2981902,
        size.width * 0.9448467,
        size.height * 0.3072156);
    path_0.cubicTo(
        size.width * 0.9352502,
        size.height * 0.3290441,
        size.width * 0.9262979,
        size.height * 0.3502101,
        size.width * 0.9172447,
        size.height * 0.3720935);
    path_0.cubicTo(
        size.width * 0.9169620,
        size.height * 0.3742463,
        size.width * 0.9167803,
        size.height * 0.3756817,
        size.width * 0.9160572,
        size.height * 0.3778133);
    path_0.cubicTo(
        size.width * 0.9117627,
        size.height * 0.3875764,
        size.width * 0.9080096,
        size.height * 0.3966432,
        size.width * 0.9037959,
        size.height * 0.4064091);
    path_0.cubicTo(
        size.width * 0.9010728,
        size.height * 0.4110928,
        size.width * 0.8984977,
        size.height * 0.4150464,
        size.width * 0.8965947,
        size.height * 0.4190665);
    path_0.cubicTo(
        size.width * 0.8660964,
        size.height * 0.4834970,
        size.width * 0.8373868,
        size.height * 0.5481177,
        size.width * 0.8046036,
        size.height * 0.6123037);
    path_0.cubicTo(
        size.width * 0.7853806,
        size.height * 0.6499404,
        size.width * 0.7594763,
        size.height * 0.6868598,
        size.width * 0.7370178,
        size.height * 0.7241572);
    path_0.cubicTo(
        size.width * 0.7254095,
        size.height * 0.7434352,
        size.width * 0.6996823,
        size.height * 0.7577455,
        size.width * 0.6579535,
        size.height * 0.7623675);
    path_0.cubicTo(
        size.width * 0.6194456,
        size.height * 0.7666328,
        size.width * 0.5783398,
        size.height * 0.7693461,
        size.width * 0.5390425,
        size.height * 0.7681566);
    path_0.cubicTo(
        size.width * 0.4111597,
        size.height * 0.7642858,
        size.width * 0.2906188,
        size.height * 0.7454563,
        size.width * 0.1706107,
        size.height * 0.7263409);
    path_0.cubicTo(
        size.width * 0.1149524,
        size.height * 0.7174754,
        size.width * 0.05963736,
        size.height * 0.7081594,
        size.width * 0.004166679,
        size.height * 0.6990476);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = greenColor;
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.9165985, size.height * 0.3771171);
    path_1.cubicTo(
        size.width * 0.9167803,
        size.height * 0.3756817,
        size.width * 0.9169620,
        size.height * 0.3742463,
        size.width * 0.9183123,
        size.height * 0.3717022);
    path_1.cubicTo(
        size.width * 0.9331515,
        size.height * 0.3621827,
        size.width * 0.9513512,
        size.height * 0.3173730,
        size.width * 0.9454910,
        size.height * 0.3065530);
    path_1.cubicTo(
        size.width * 0.9481669,
        size.height * 0.2981902,
        size.width * 0.9508428,
        size.height * 0.2898274,
        size.width * 0.9551414,
        size.height * 0.2803593);
    path_1.cubicTo(
        size.width * 0.9600595,
        size.height * 0.2759308,
        size.width * 0.9650852,
        size.height * 0.2727402,
        size.width * 0.9663599,
        size.height * 0.2692623);
    path_1.cubicTo(
        size.width * 0.9729930,
        size.height * 0.2511632,
        size.width * 0.9791077,
        size.height * 0.2330174,
        size.width * 0.9843904,
        size.height * 0.2148263);
    path_1.cubicTo(
        size.width * 0.9858004,
        size.height * 0.2099706,
        size.width * 0.9836486,
        size.height * 0.2048988,
        size.width * 0.9831320,
        size.height * 0.1999262);
    path_1.cubicTo(
        size.width * 0.9831755,
        size.height * 0.1990966,
        size.width * 0.9832190,
        size.height * 0.1982671,
        size.width * 0.9840102,
        size.height * 0.1965117);
    path_1.cubicTo(
        size.width * 0.9843525,
        size.height * 0.1938861,
        size.width * 0.9839470,
        size.height * 0.1921864,
        size.width * 0.9835416,
        size.height * 0.1904867);
    path_1.cubicTo(
        size.width * 0.9846228,
        size.height * 0.1883564,
        size.width * 0.9857039,
        size.height * 0.1862260,
        size.width * 0.9882927,
        size.height * 0.1831355);
    path_1.cubicTo(
        size.width * 0.9945891,
        size.height * 0.1804978,
        size.width * 0.9993779,
        size.height * 0.1788203,
        size.width * 1.004167,
        size.height * 0.1771429);
    path_1.cubicTo(
        size.width * 1.004167,
        size.height * 0.2533731,
        size.width * 1.004167,
        size.height * 0.3296034,
        size.width * 1.003049,
        size.height * 0.4072377);
    path_1.cubicTo(
        size.width * 0.9863421,
        size.height * 0.4457785,
        size.width * 0.9707537,
        size.height * 0.4829152,
        size.width * 0.9547915,
        size.height * 0.5206907);
    path_1.cubicTo(
        size.width * 0.9542929,
        size.height * 0.5222078,
        size.width * 0.9541681,
        size.height * 0.5230862,
        size.width * 0.9532785,
        size.height * 0.5245744);
    path_1.cubicTo(
        size.width * 0.9488701,
        size.height * 0.5335629,
        size.width * 0.9452265,
        size.height * 0.5419418,
        size.width * 0.9408586,
        size.height * 0.5508638);
    path_1.cubicTo(
        size.width * 0.9393898,
        size.height * 0.5530508,
        size.width * 0.9386453,
        size.height * 0.5546948,
        size.width * 0.9373775,
        size.height * 0.5570108);
    path_1.cubicTo(
        size.width * 0.9332061,
        size.height * 0.5644082,
        size.width * 0.9295998,
        size.height * 0.5711385,
        size.width * 0.9259027,
        size.height * 0.5778582);
    path_1.cubicTo(
        size.width * 0.9089403,
        size.height * 0.6086878,
        size.width * 0.8919525,
        size.height * 0.6395146,
        size.width * 0.8742610,
        size.height * 0.6708955);
    path_1.cubicTo(
        size.width * 0.8727224,
        size.height * 0.6730963,
        size.width * 0.8718966,
        size.height * 0.6747438,
        size.width * 0.8703571,
        size.height * 0.6769940);
    path_1.cubicTo(
        size.width * 0.8569730,
        size.height * 0.6963512,
        size.width * 0.8463661,
        size.height * 0.7154622,
        size.width * 0.8312188,
        size.height * 0.7337889);
    path_1.cubicTo(
        size.width * 0.7955065,
        size.height * 0.7769977,
        size.width * 0.7576306,
        size.height * 0.8198328,
        size.width * 0.7197886,
        size.height * 0.8632034);
    path_1.cubicTo(
        size.width * 0.7181124,
        size.height * 0.8645939,
        size.width * 0.7172775,
        size.height * 0.8656001,
        size.width * 0.7155467,
        size.height * 0.8669717);
    path_1.cubicTo(
        size.width * 0.7137328,
        size.height * 0.8683385,
        size.width * 0.7128149,
        size.height * 0.8693400,
        size.width * 0.7109042,
        size.height * 0.8708040);
    path_1.cubicTo(
        size.width * 0.6793641,
        size.height * 0.8919467,
        size.width * 0.6518498,
        size.height * 0.9137566,
        size.width * 0.6175078,
        size.height * 0.9330232);
    path_1.cubicTo(
        size.width * 0.5738127,
        size.height * 0.9575374,
        size.width * 0.5168160,
        size.height * 0.9668656,
        size.width * 0.4486519,
        size.height * 0.9543672);
    path_1.cubicTo(
        size.width * 0.4306663,
        size.height * 0.9510693,
        size.width * 0.4122055,
        size.height * 0.9482654,
        size.width * 0.3945793,
        size.height * 0.9446132);
    path_1.cubicTo(
        size.width * 0.2853384,
        size.height * 0.9219776,
        size.width * 0.1871651,
        size.height * 0.8912465,
        size.width * 0.09262765,
        size.height * 0.8578888);
    path_1.cubicTo(
        size.width * 0.06313767,
        size.height * 0.8474832,
        size.width * 0.03365352,
        size.height * 0.8370741,
        size.width * 0.004166692,
        size.height * 0.8266667);
    path_1.cubicTo(
        size.width * 0.004166667,
        size.height * 0.7847221,
        size.width * 0.004166667,
        size.height * 0.7427776,
        size.width * 0.004166679,
        size.height * 0.6999402);
    path_1.cubicTo(
        size.width * 0.05963736,
        size.height * 0.7081594,
        size.width * 0.1149524,
        size.height * 0.7174754,
        size.width * 0.1706107,
        size.height * 0.7263409);
    path_1.cubicTo(
        size.width * 0.2906188,
        size.height * 0.7454563,
        size.width * 0.4111597,
        size.height * 0.7642858,
        size.width * 0.5390425,
        size.height * 0.7681566);
    path_1.cubicTo(
        size.width * 0.5783398,
        size.height * 0.7693461,
        size.width * 0.6194456,
        size.height * 0.7666328,
        size.width * 0.6579535,
        size.height * 0.7623675);
    path_1.cubicTo(
        size.width * 0.6996823,
        size.height * 0.7577455,
        size.width * 0.7254095,
        size.height * 0.7434352,
        size.width * 0.7370178,
        size.height * 0.7241572);
    path_1.cubicTo(
        size.width * 0.7594763,
        size.height * 0.6868598,
        size.width * 0.7853806,
        size.height * 0.6499404,
        size.width * 0.8046036,
        size.height * 0.6123037);
    path_1.cubicTo(
        size.width * 0.8373868,
        size.height * 0.5481177,
        size.width * 0.8660964,
        size.height * 0.4834970,
        size.width * 0.8965947,
        size.height * 0.4190665);
    path_1.cubicTo(
        size.width * 0.8984977,
        size.height * 0.4150464,
        size.width * 0.9010728,
        size.height * 0.4110928,
        size.width * 0.9048332,
        size.height * 0.4059660);
    path_1.cubicTo(
        size.width * 0.9212223,
        size.height * 0.3964764,
        size.width * 0.9240440,
        size.height * 0.3871943,
        size.width * 0.9165985,
        size.height * 0.3771171);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = const Color(0xff029D36).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.004166692, size.height * 0.8275593);
    path_2.cubicTo(
        size.width * 0.03365352,
        size.height * 0.8370741,
        size.width * 0.06313767,
        size.height * 0.8474832,
        size.width * 0.09262765,
        size.height * 0.8578888);
    path_2.cubicTo(
        size.width * 0.1871651,
        size.height * 0.8912465,
        size.width * 0.2853384,
        size.height * 0.9219776,
        size.width * 0.3945793,
        size.height * 0.9446132);
    path_2.cubicTo(
        size.width * 0.4122055,
        size.height * 0.9482654,
        size.width * 0.4306663,
        size.height * 0.9510693,
        size.width * 0.4486519,
        size.height * 0.9543672);
    path_2.cubicTo(
        size.width * 0.5168160,
        size.height * 0.9668656,
        size.width * 0.5738127,
        size.height * 0.9575374,
        size.width * 0.6175078,
        size.height * 0.9330232);
    path_2.cubicTo(
        size.width * 0.6518498,
        size.height * 0.9137566,
        size.width * 0.6793641,
        size.height * 0.8919467,
        size.width * 0.7115901,
        size.height * 0.8703696);
    path_2.cubicTo(
        size.width * 0.7143269,
        size.height * 0.8685172,
        size.width * 0.7153848,
        size.height * 0.8675617,
        size.width * 0.7164427,
        size.height * 0.8666063);
    path_2.cubicTo(
        size.width * 0.7172775,
        size.height * 0.8656001,
        size.width * 0.7181124,
        size.height * 0.8645939,
        size.width * 0.7209798,
        size.height * 0.8628607);
    path_2.cubicTo(
        size.width * 0.7470453,
        size.height * 0.8395176,
        size.width * 0.7738461,
        size.height * 0.8174112,
        size.width * 0.7943530,
        size.height * 0.7941455);
    path_2.cubicTo(
        size.width * 0.8160017,
        size.height * 0.7695843,
        size.width * 0.8326143,
        size.height * 0.7440521,
        size.width * 0.8495320,
        size.height * 0.7186800);
    path_2.cubicTo(
        size.width * 0.8587425,
        size.height * 0.7048668,
        size.width * 0.8640196,
        size.height * 0.6905055,
        size.width * 0.8710709,
        size.height * 0.6763914);
    path_2.cubicTo(
        size.width * 0.8718966,
        size.height * 0.6747438,
        size.width * 0.8727224,
        size.height * 0.6730963,
        size.width * 0.8755021,
        size.height * 0.6705742);
    path_2.cubicTo(
        size.width * 0.8810039,
        size.height * 0.6670869,
        size.width * 0.8862865,
        size.height * 0.6646715,
        size.width * 0.8878329,
        size.height * 0.6618309);
    path_2.cubicTo(
        size.width * 0.9045722,
        size.height * 0.6310836,
        size.width * 0.9209415,
        size.height * 0.6002929,
        size.width * 0.9367812,
        size.height * 0.5694463);
    path_2.cubicTo(
        size.width * 0.9389271,
        size.height * 0.5652673,
        size.width * 0.9376129,
        size.height * 0.5607170,
        size.width * 0.9379008,
        size.height * 0.5563387);
    path_2.cubicTo(
        size.width * 0.9386453,
        size.height * 0.5546948,
        size.width * 0.9393898,
        size.height * 0.5530508,
        size.width * 0.9419306,
        size.height * 0.5504361);
    path_2.cubicTo(
        size.width * 0.9471656,
        size.height * 0.5409651,
        size.width * 0.9506044,
        size.height * 0.5324649,
        size.width * 0.9540432,
        size.height * 0.5239647);
    path_2.cubicTo(
        size.width * 0.9541681,
        size.height * 0.5230862,
        size.width * 0.9542929,
        size.height * 0.5222078,
        size.width * 0.9559738,
        size.height * 0.5203234);
    path_2.cubicTo(
        size.width * 0.9606305,
        size.height * 0.5162785,
        size.width * 0.9652340,
        size.height * 0.5133732,
        size.width * 0.9665919,
        size.height * 0.5101795);
    path_2.cubicTo(
        size.width * 0.9766862,
        size.height * 0.4864382,
        size.width * 0.9859707,
        size.height * 0.4626250,
        size.width * 0.9960009,
        size.height * 0.4388777);
    path_2.cubicTo(
        size.width * 0.9972390,
        size.height * 0.4359462,
        size.width * 1.001374,
        size.height * 0.4332705,
        size.width * 1.004167,
        size.height * 0.4304762);
    path_2.cubicTo(
        size.width * 1.004167,
        size.height * 0.6208204,
        size.width * 1.004167,
        size.height * 0.8111647,
        size.width * 1.004167,
        size.height * 1.001707);
    path_2.cubicTo(
        size.width * 0.6708336,
        size.height * 1.001707,
        size.width * 0.3375002,
        size.height * 1.001707,
        size.width * 0.004166667,
        size.height * 1.001707);
    path_2.cubicTo(
        size.width * 0.004166667,
        size.height * 0.9439278,
        size.width * 0.004166667,
        size.height * 0.8861899,
        size.width * 0.004166692,
        size.height * 0.8275593);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = const Color(0xff82CE65).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 1.004167, size.height * 0.4295988);
    path_3.cubicTo(
        size.width * 1.001374,
        size.height * 0.4332705,
        size.width * 0.9972390,
        size.height * 0.4359462,
        size.width * 0.9960009,
        size.height * 0.4388777);
    path_3.cubicTo(
        size.width * 0.9859707,
        size.height * 0.4626250,
        size.width * 0.9766862,
        size.height * 0.4864382,
        size.width * 0.9665919,
        size.height * 0.5101795);
    path_3.cubicTo(
        size.width * 0.9652340,
        size.height * 0.5133732,
        size.width * 0.9606305,
        size.height * 0.5162785,
        size.width * 0.9563475,
        size.height * 0.5196847);
    path_3.cubicTo(
        size.width * 0.9707537,
        size.height * 0.4829152,
        size.width * 0.9863421,
        size.height * 0.4457785,
        size.width * 1.003049,
        size.height * 0.4081304);
    path_3.cubicTo(
        size.width * 1.004167,
        size.height * 0.4146531,
        size.width * 1.004167,
        size.height * 0.4216873,
        size.width * 1.004167,
        size.height * 0.4295988);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = const Color(0xff6CD06B).withOpacity(1.0);
    canvas.drawPath(path_3, paint_3_fill);

    Path path_4 = Path();
    path_4.moveTo(size.width * 1.004167, size.height * 0.1762502);
    path_4.cubicTo(
        size.width * 0.9993779,
        size.height * 0.1788203,
        size.width * 0.9945891,
        size.height * 0.1804978,
        size.width * 0.9887484,
        size.height * 0.1825125);
    path_4.cubicTo(
        size.width * 0.9928631,
        size.height * 0.1636499,
        size.width * 0.9980296,
        size.height * 0.1444500,
        size.width * 1.003681,
        size.height * 0.1245299);
    path_4.cubicTo(
        size.width * 1.004167,
        size.height * 0.1409922,
        size.width * 1.004167,
        size.height * 0.1581748,
        size.width * 1.004167,
        size.height * 0.1762502);
    path_4.close();

    Paint paint_4_fill = Paint()..style = PaintingStyle.fill;
    paint_4_fill.color = const Color(0xff059931).withOpacity(1.0);
    canvas.drawPath(path_4, paint_4_fill);

    Path path_5 = Path();
    path_5.moveTo(size.width * 0.9825289, size.height * 0.2006116);
    path_5.cubicTo(
        size.width * 0.9836486,
        size.height * 0.2048988,
        size.width * 0.9858004,
        size.height * 0.2099706,
        size.width * 0.9843904,
        size.height * 0.2148263);
    path_5.cubicTo(
        size.width * 0.9791077,
        size.height * 0.2330174,
        size.width * 0.9729930,
        size.height * 0.2511632,
        size.width * 0.9663599,
        size.height * 0.2692623);
    path_5.cubicTo(
        size.width * 0.9650852,
        size.height * 0.2727402,
        size.width * 0.9600595,
        size.height * 0.2759308,
        size.width * 0.9555382,
        size.height * 0.2796264);
    path_5.cubicTo(
        size.width * 0.9635167,
        size.height * 0.2537650,
        size.width * 0.9727212,
        size.height * 0.2275310,
        size.width * 0.9825289,
        size.height * 0.2006116);
    path_5.close();

    Paint paint_5_fill = Paint()..style = PaintingStyle.fill;
    paint_5_fill.color = const Color(0xff059931).withOpacity(1.0);
    canvas.drawPath(path_5, paint_5_fill);

    Path path_6 = Path();
    path_6.moveTo(size.width * 0.9448467, size.height * 0.3072156);
    path_6.cubicTo(
        size.width * 0.9513512,
        size.height * 0.3173730,
        size.width * 0.9331515,
        size.height * 0.3621827,
        size.width * 0.9184132,
        size.height * 0.3709848);
    path_6.cubicTo(
        size.width * 0.9262979,
        size.height * 0.3502101,
        size.width * 0.9352502,
        size.height * 0.3290441,
        size.width * 0.9448467,
        size.height * 0.3072156);
    path_6.close();

    Paint paint_6_fill = Paint()..style = PaintingStyle.fill;
    paint_6_fill.color = const Color(0xff059931).withOpacity(1.0);
    canvas.drawPath(path_6, paint_6_fill);

    Path path_7 = Path();
    path_7.moveTo(size.width * 0.9160572, size.height * 0.3778133);
    path_7.cubicTo(
        size.width * 0.9240440,
        size.height * 0.3871943,
        size.width * 0.9212223,
        size.height * 0.3964764,
        size.width * 0.9052938,
        size.height * 0.4052669);
    path_7.cubicTo(
        size.width * 0.9080096,
        size.height * 0.3966432,
        size.width * 0.9117627,
        size.height * 0.3875764,
        size.width * 0.9160572,
        size.height * 0.3778133);
    path_7.close();

    Paint paint_7_fill = Paint()..style = PaintingStyle.fill;
    paint_7_fill.color = const Color(0xff059931).withOpacity(1.0);
    canvas.drawPath(path_7, paint_7_fill);

    Path path_8 = Path();
    path_8.moveTo(size.width * 0.9834670, size.height * 0.1911992);
    path_8.cubicTo(
        size.width * 0.9839470,
        size.height * 0.1921864,
        size.width * 0.9843525,
        size.height * 0.1938861,
        size.width * 0.9840626,
        size.height * 0.1958898);
    path_8.cubicTo(
        size.width * 0.9833757,
        size.height * 0.1947664,
        size.width * 0.9833841,
        size.height * 0.1933391,
        size.width * 0.9834670,
        size.height * 0.1911992);
    path_8.close();

    Paint paint_8_fill = Paint()..style = PaintingStyle.fill;
    paint_8_fill.color = const Color(0xff059931).withOpacity(1.0);
    canvas.drawPath(path_8, paint_8_fill);

    Path path_9 = Path();
    path_9.moveTo(size.width * 0.8703571, size.height * 0.6769940);
    path_9.cubicTo(
        size.width * 0.8640196,
        size.height * 0.6905055,
        size.width * 0.8587425,
        size.height * 0.7048668,
        size.width * 0.8495320,
        size.height * 0.7186800);
    path_9.cubicTo(
        size.width * 0.8326143,
        size.height * 0.7440521,
        size.width * 0.8160017,
        size.height * 0.7695843,
        size.width * 0.7943530,
        size.height * 0.7941455);
    path_9.cubicTo(
        size.width * 0.7738461,
        size.height * 0.8174112,
        size.width * 0.7470453,
        size.height * 0.8395176,
        size.width * 0.7218212,
        size.height * 0.8624765);
    path_9.cubicTo(
        size.width * 0.7576306,
        size.height * 0.8198328,
        size.width * 0.7955065,
        size.height * 0.7769977,
        size.width * 0.8312188,
        size.height * 0.7337889);
    path_9.cubicTo(
        size.width * 0.8463661,
        size.height * 0.7154622,
        size.width * 0.8569730,
        size.height * 0.6963512,
        size.width * 0.8703571,
        size.height * 0.6769940);
    path_9.close();

    Paint paint_9_fill = Paint()..style = PaintingStyle.fill;
    paint_9_fill.color = const Color(0xff6CD06B).withOpacity(1.0);
    canvas.drawPath(path_9, paint_9_fill);

    Path path_10 = Path();
    path_10.moveTo(size.width * 0.9373774, size.height * 0.5570108);
    path_10.cubicTo(
        size.width * 0.9376129,
        size.height * 0.5607170,
        size.width * 0.9389271,
        size.height * 0.5652673,
        size.width * 0.9367812,
        size.height * 0.5694463);
    path_10.cubicTo(
        size.width * 0.9209415,
        size.height * 0.6002929,
        size.width * 0.9045722,
        size.height * 0.6310836,
        size.width * 0.8878329,
        size.height * 0.6618309);
    path_10.cubicTo(
        size.width * 0.8862865,
        size.height * 0.6646715,
        size.width * 0.8810039,
        size.height * 0.6670869,
        size.width * 0.8762150,
        size.height * 0.6700210);
    path_10.cubicTo(
        size.width * 0.8919525,
        size.height * 0.6395146,
        size.width * 0.9089403,
        size.height * 0.6086878,
        size.width * 0.9259027,
        size.height * 0.5778582);
    path_10.cubicTo(
        size.width * 0.9295998,
        size.height * 0.5711385,
        size.width * 0.9332061,
        size.height * 0.5644082,
        size.width * 0.9373774,
        size.height * 0.5570108);
    path_10.close();

    Paint paint_10_fill = Paint()..style = PaintingStyle.fill;
    paint_10_fill.color = const Color(0xff6CD06B).withOpacity(1.0);
    canvas.drawPath(path_10, paint_10_fill);

    Path path_11 = Path();
    path_11.moveTo(size.width * 0.9532785, size.height * 0.5245744);
    path_11.cubicTo(
        size.width * 0.9506044,
        size.height * 0.5324649,
        size.width * 0.9471656,
        size.height * 0.5409651,
        size.width * 0.9426549,
        size.height * 0.5498930);
    path_11.cubicTo(
        size.width * 0.9452265,
        size.height * 0.5419418,
        size.width * 0.9488701,
        size.height * 0.5335629,
        size.width * 0.9532785,
        size.height * 0.5245744);
    path_11.close();

    Paint paint_11_fill = Paint()..style = PaintingStyle.fill;
    paint_11_fill.color = const Color(0xff6CD06B).withOpacity(1.0);
    canvas.drawPath(path_11, paint_11_fill);

    Path path_12 = Path();
    path_12.moveTo(size.width * 0.7155467, size.height * 0.8669717);
    path_12.cubicTo(
        size.width * 0.7153848,
        size.height * 0.8675617,
        size.width * 0.7143269,
        size.height * 0.8685172,
        size.width * 0.7125830,
        size.height * 0.8699071);
    path_12.cubicTo(
        size.width * 0.7128149,
        size.height * 0.8693400,
        size.width * 0.7137328,
        size.height * 0.8683385,
        size.width * 0.7155467,
        size.height * 0.8669717);
    path_12.close();

    Paint paint_12_fill = Paint()..style = PaintingStyle.fill;
    paint_12_fill.color = const Color(0xff6CD06B).withOpacity(1.0);
    canvas.drawPath(path_12, paint_12_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
