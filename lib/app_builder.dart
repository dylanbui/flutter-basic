
import 'package:flutter/material.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_builder.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';
import 'package:simple_auth_1/login_scene/splash_start/splash_start_builder.dart';
import 'package:simple_auth_1/session_user.dart';
import 'package:simple_auth_1/typi_code/main_tab/main_tab_builder.dart';
import 'package:simple_auth_1/utils/logger.dart';

import 'app.dart';


class SplashPageCompleteRoute extends DbNoteRoute {
  String? message;
  SplashPageCompleteRoute({this.message});
}
//
// class ForgotPasswordRouter extends DbDefineRoute {
//   int codeFw;
//   String? messageFw;
//   ForgotPasswordRouter(this.codeFw, this.messageFw);
// }
//
// class AuthPasswordRouter extends DbDefineRoute {
//   String strCodeAuth;
//   AuthPasswordRouter(this.strCodeAuth);
// }

class AppBuilder extends DbNoteBuilder implements SplashStartListener {

  AppBuilder() : super() {
    // var splashStartPage = SplashStartPage(nav: this,);
    // rootPage = ChangeNotifierProvider<SplashStartProvider>.value(value: SplashStartProvider(), child: splashStartPage,);

    // rootPage = SplashStartPage(nav: this,);

    var splashStartBuilder = SplashStartBuilder.withListener(this);
    // var splashStartBuilder = SplashStartBuilder.withAny("", 1);
    rootPage = splashStartBuilder.rootPage;
  }

  @override
  void start(BuildContext fromContext) {
    // Navigator.push(buildContext, PageTransition(child: rootPage, type: PageTransitionType.rightToLeft),);
  }

  @override
  void startSameRootPage(BuildContext fromContext) {
    // TODO: implement startSameRootController
  }

  @override
  void splashPageComplete(BuildContext currentContext, String? message) {
    // Lay thong tin current user, kiem tra da login chua
    if (App().currentUser.isLogin()) {
      dLog("AppCoordinator -- DA LOGIN ROI");
      dLog(App().currentUser.toString());
    } else {
      dLog("AppCoordinator -- CHUAAAA LOGIN");
    }


    // Sau khi login xong thi chay thang nay
    final mainTabBuilder = MainTabBuilder();
    mainTabBuilder.start(currentContext);



  }











}