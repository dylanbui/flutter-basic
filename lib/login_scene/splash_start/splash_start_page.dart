import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';
import 'package:simple_auth_1/commons/base_stateless_widget.dart';
import 'package:simple_auth_1/login_scene/splash_start/splash_start_builder.dart';
import 'package:simple_auth_1/login_scene/splash_start/splash_start_provider.dart';


//ignore: must_be_immutable
// class SplashStartPage extends BaseStateFulWidget {
//   SplashStartPage({Key? key, DbNavigation? nav}) : super(key: key, nav: nav);
//
//   @override
//   State<StatefulWidget> createState() {
//     return _SplashStartPage();
//   }
// }


// Su dung StateLess hay StateFul cung deu khong Animation dc cho nay
//ignore: must_be_immutable
class SplashStartPage extends BaseStateLessWidget<SplashStartProvider> {

  SplashStartPage({Key? key, DbRouting? routing}) : super(key: key, routing: routing);

// class _SplashStartPage extends BaseState<SplashStartPage, SplashStartProvider> {

  @override
  Widget getLayout(BuildContext context) {

    // Gia lap chay lay du lieu tu server
    pageProvider.fetchSomething().then((value) {
      // final router = MaterialPageRoute(builder: (context) => const SplashPage(),);
      // Navigator.pushReplacement(context, router);

      log("Gia tri tra ve tu fetchSomething : " + value);
      routing?.navigate(SplashPageCompleteRoute(message: value), context);

      // Navigator.pushReplacement(context, PageTransition(
      //     child: const SplashPage(),
      //     type: PageTransitionType.fade),);

      // Navigator.push(context, PageTransition(
      //     child: ChangeNotifierProvider<LoginProvider>.value(value: LoginProvider(), child: const LoginPage(),),
      //     type: PageTransitionType.rightToLeft),);

    });

    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.9],
          colors: [
            Color(0xFFFC5C7D),
            Color(0xFF6A82FB),
          ],
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 90.0),
      child: Image.asset(
        "assets/images/logo_splash.png",
        fit: BoxFit.scaleDown,
      ),
    );
  }

}