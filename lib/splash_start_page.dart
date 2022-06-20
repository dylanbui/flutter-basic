import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_auth_1/app_coordinator.dart';
import 'package:simple_auth_1/commons/base_statefull_widget.dart';
import 'package:simple_auth_1/commons/base_stateless_widget.dart';
import 'package:simple_auth_1/commons/coordinator/constants.dart';
import 'package:simple_auth_1/splash_page.dart';


class SplashStartPage extends  BaseStateLessWidget {
  SplashStartPage({Key? key , DbNavigation? nav}) : super(key: key, nav: nav);

  Future<String> fetchSomething() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // final _isHaveData = prefs.getString(Constants.sp_have_data) ?? "";

    //TODO Call API from server and do sth
    await Future.delayed(const Duration(seconds: 3));
    return "Da chay SplashStartPage --- DONE";

    // if (_isHaveData.isEmpty) {
    //   await prefs.setString(Constants.sp_have_data, "just login_scene.login");
    //   view.goToNextScreen(true);
    // } else {
    //   view.goToNextScreen(false);
    // }

  }

  @override
  Widget getLayout(BuildContext context) {

    // Gia lap chay lay du lieu tu server
    fetchSomething().then((value) {
      // final router = MaterialPageRoute(builder: (context) => const SplashPage(),);
      // Navigator.pushReplacement(context, router);

      log("Gia tri truoc khi chay " + value);
      log("Gia tri truoc khi chay " + value);

      if (nav == null) {
        log("nav la NULLLLL ");
      }

      nav?.navigate(SplashPageCompleteRouter(message: value), context);

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