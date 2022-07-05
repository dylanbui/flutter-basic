/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 05/07/2022 - 14:24
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';
import 'package:simple_auth_1/constants.dart';
import 'package:simple_auth_1/login_scene/signup/signup_builder.dart';

// Route

class SignUpRoute extends DbRoute {
  User user;
  SignupPageListener listener;
  SignUpRoute(this.user, this.listener);
}

class ForgotPasswordRoute extends DbRoute {
  int codeFw;
  String? messageFw;
  ForgotPasswordRoute(this.codeFw, this.messageFw);
}

// Router

class LoginRouter extends DbRouting {

  @override
  void navigate(DbRoute toRoute, BuildContext nextContext, {Map<String, Object>? parameters}) {
    if (toRoute is SignUpRoute) {
      SignupBuildable signupBuilder = SignupBuilder();
      final widget = signupBuilder.build(toRoute.listener);
      // Push to page , cho nay tu control animation cua no
      push(nextContext, widget);
    }
  }
}