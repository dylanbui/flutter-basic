/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 05/07/2022 - 15:23
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';
import 'package:simple_auth_1/login_scene/forgot_password/forgot_password_builder.dart';

class AuthPasswordRoute extends DbRoute {
  String strCodeAuth;
  AuthPasswordRoute(this.strCodeAuth);
}

class AuthPasswordCompletedRoute extends DbRoute {
  int userId;
  AuthPasswordCompletedRoute(this.userId);
}

class ForgotPasswordRouter extends DbRouting {

  @override
  void navigate(DbRoute toRoute, BuildContext nextContext, {Map<String, Object>? parameters}) {

    if (toRoute is AuthPasswordRoute) {
      // Navigation to AuthPasswordRouter
      ForgotPasswordBuildable forgotPasswordBuilder = ForgotPasswordBuilder();
      final widget = forgotPasswordBuilder.buildAuthPassword(toRoute.strCodeAuth);
      push(nextContext, widget);
    }

  }
}