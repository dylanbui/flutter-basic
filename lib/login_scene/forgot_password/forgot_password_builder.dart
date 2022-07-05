/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 04/07/2022 - 15:06
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_builder.dart';
import 'package:simple_auth_1/login_scene/forgot_password/auth_password/auth_password_page.dart';
import 'package:simple_auth_1/login_scene/forgot_password/forgot_password_router.dart';

import 'auth_password/auth_password_provider.dart';
import 'forgot_password_page.dart';
import 'forgot_password_provider.dart';

// Listener

// abstract class SignupPageListener {
//   void returnWithAbstractClass(String returnText);
// }

// Buildable

abstract class ForgotPasswordBuildable extends DbBuildable {

  Widget build();
  Widget buildWith(int codeFw, String? messageFw);

  Widget buildAuthPassword(String strCodeAuth);

}

/* Minh hoa ForgotPassword va AuthPassword cung dung chung 1 builder, 1 router

Cho nay van con giai quyet van de thong nhat callback goi ve tu trang con, cu the la AuthPasswordPage can call len ForgotPasswordBuilder
Giai phap xem xet den la Dependency da co trong code

* */

class ForgotPasswordBuilder extends DbBuilder implements ForgotPasswordBuildable {

  final _routing = ForgotPasswordRouter();

  @override
  Widget build() {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  Widget buildWith(int codeFw, String? messageFw) {
    final forgotPasswordPage = ForgotPasswordPage(codeFw, messageFw: messageFw, routing: _routing,);
    return ChangeNotifierProvider<ForgotPasswordProvider>.value(value: ForgotPasswordProvider(), child: forgotPasswordPage,);
  }

  @override
  Widget buildAuthPassword(String strCodeAuth) {
    final authPasswordPage = AuthPasswordPage(strCodeAuth, routing: _routing,);
    return ChangeNotifierProvider<AuthPasswordProvider>.value(value: AuthPasswordProvider(), child: authPasswordPage,);
  }


}