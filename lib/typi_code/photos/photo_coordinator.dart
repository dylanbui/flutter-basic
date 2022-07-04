/*
 * Created with IntelliJ IDEA
 * Package: typi_code
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 24/06/2022 - 11:06
 * To change this template use File | Settings | File Templates.
 */


import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:simple_auth_1/commons/coordinator/constants.dart';
import 'package:simple_auth_1/login_scene/show_alert_demo/show_alert_page.dart';
import 'package:simple_auth_1/login_scene/show_alert_demo/show_alert_provider.dart';
import 'package:simple_auth_1/login_scene/show_layout_demo/show_layout_page.dart';
import 'package:simple_auth_1/typi_code/photos/photo_list_page.dart';
import 'package:simple_auth_1/typi_code/photos/photo_list_provider.dart';

import '../../login_scene/show_layout_demo/show_layout_provider.dart';

class PhotoDetailRouter {
  int photoId;
  PhotoDetailRouter(this.photoId);
}

class PhotoCoordinator extends DbCoordinator implements DbNavigation {

  PhotoCoordinator() : super() {
    var photoListPage = PhotoListPage(nav: this,);
    rootPage = ChangeNotifierProvider<PhotoListProvider>.value(value: PhotoListProvider(), child: photoListPage,);
  }

  @override
  void start(BuildContext fromContext) {
    Navigator.push(fromContext, PageTransition(child: rootPage, type: PageTransitionType.rightToLeft),);
  }

  @override
  void startSameRootPage(BuildContext fromContext) {
    // Navigator.pushAndRemoveUntil(buildContext, PageTransition(child: rootPage, type: PageTransitionType.rightToLeft),
    //         (route) => route.isFirst == true);
    Navigator.pushAndRemoveUntil(fromContext, PageTransition(child: rootPage, type: PageTransitionType.rightToLeft), (route) => false);
  }

  void startDemoAlert(BuildContext fromContext) {
    var showAlertPage = ShowAlertPage(nav: this,);
    rootPage = ChangeNotifierProvider<ShowAlertProvider>.value(value: ShowAlertProvider(), child: showAlertPage,);
    Navigator.push(fromContext, PageTransition(child: rootPage, type: PageTransitionType.rightToLeft),);
  }

  void startDemoLayout(BuildContext fromContext) {
    var showDemoPage = ShowLayoutPage(nav: this,);
    rootPage = ChangeNotifierProvider<ShowLayoutProvider>.value(value: ShowLayoutProvider(), child: showDemoPage,);
    Navigator.push(fromContext, PageTransition(child: rootPage, type: PageTransitionType.rightToLeft),);
  }

  @override
  void navigate(DbDefineRoute toRoute, BuildContext nextContext, {Map<String, Object>? parameters}) {
    if (toRoute is PhotoDetailRouter) {
      // Navigation to ForgotPasswordRouter
      // final commentDetailPage = CommentDetailPage(toRoute.commentId, nav: this,);
      // var commentDetailChild = ChangeNotifierProvider<CommentDetailProvider>.value(value: CommentDetailProvider(), child: commentDetailPage,);
      // Navigator.push(nextContext, PageTransition(child: commentDetailChild, type: PageTransitionType.rightToLeft),);
    }


  }

  @override
  void pop(BuildContext context) {
    Navigator.pop(context);
  }
}

