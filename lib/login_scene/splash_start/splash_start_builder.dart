/*
 * Created with IntelliJ IDEA
 * Package: login_scene.splash_start
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 04/07/2022 - 11:23
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_builder.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';
import 'package:simple_auth_1/login_scene/splash_start/splash_start_page.dart';
import 'package:simple_auth_1/login_scene/splash_start/splash_start_provider.dart';

abstract class SplashStartListener {
  void splashPageComplete(BuildContext currentContext, String? message);
}

class SplashPageCompleteRoute extends DbNoteRoute {
  String? message;
  SplashPageCompleteRoute({this.message});
}


class SplashStartBuilder extends DbNoteBuilder with DbNoteRouter {

  SplashStartListener? listener;

  SplashStartBuilder() : super() {
    var splashStartPage = SplashStartPage(router: this,);
    rootPage = ChangeNotifierProvider<SplashStartProvider>.value(value: SplashStartProvider(), child: splashStartPage,);
  }

  // Demo cac overwrite
  SplashStartBuilder.withAny(String param_1, int param_2) {
    var splashStartPage = SplashStartPage(router: this,);
    rootPage = ChangeNotifierProvider<SplashStartProvider>.value(value: SplashStartProvider(), child: splashStartPage,);
  }

  // Demo cac overwrite
  SplashStartBuilder.withListener(this.listener) {
    var splashStartPage = SplashStartPage(router: this,);
    rootPage = ChangeNotifierProvider<SplashStartProvider>.value(value: SplashStartProvider(), child: splashStartPage,);
  }

  @override
  void start(BuildContext fromContext) {


  }

  @override
  void navigate(DbNoteRoute toRoute, BuildContext nextContext, {Map<String, Object>? parameters}) {
    if (toRoute is SplashPageCompleteRoute) {
      listener?.splashPageComplete(nextContext, toRoute.message);
      // parentRouter?.goiLenParentRouter();
    }

  }
}