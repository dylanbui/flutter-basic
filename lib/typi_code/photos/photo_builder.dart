/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 04/07/2022 - 15:43
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_builder.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';
import 'package:simple_auth_1/login_scene/show_alert_demo/show_alert_page.dart';
import 'package:simple_auth_1/login_scene/show_alert_demo/show_alert_provider.dart';
import 'package:simple_auth_1/login_scene/show_layout_demo/show_layout_page.dart';
import 'package:simple_auth_1/login_scene/show_layout_demo/show_layout_provider.dart';
import 'package:simple_auth_1/typi_code/photos/photo_list_page.dart';
import 'package:simple_auth_1/typi_code/photos/photo_list_provider.dart';

// Listener

// Buildable

abstract class PhotoBuildable extends DbNoteBuildable {

  Widget build();
  Widget buildDemoAlert();
  Widget buildDemoLayout();

}

// Builder

class PhotoDetailRoute {
  int photoId;
  PhotoDetailRoute(this.photoId);
}

class PhotoBuilder extends DbNoteBuilder with DbNoteRouter implements PhotoBuildable {

  void startDemoAlert(BuildContext fromContext) {
    // var showAlertPage = ShowAlertPage(nav: this,);
    // rootPage = ChangeNotifierProvider<ShowAlertProvider>.value(value: ShowAlertProvider(), child: showAlertPage,);
    // Navigator.push(fromContext, PageTransition(child: rootPage, type: PageTransitionType.rightToLeft),);
  }

  void startDemoLayout(BuildContext fromContext) {
    // var showDemoPage = ShowLayoutPage(nav: this,);
    // rootPage = ChangeNotifierProvider<ShowLayoutProvider>.value(value: ShowLayoutProvider(), child: showDemoPage,);
    // Navigator.push(fromContext, PageTransition(child: rootPage, type: PageTransitionType.rightToLeft),);
  }

  @override
  Widget build() {
    var photoListPage = PhotoListPage(router: this,);
    rootPage = ChangeNotifierProvider<PhotoListProvider>.value(value: PhotoListProvider(), child: photoListPage,);
    return rootPage;
  }

  @override
  void navigate(DbNoteRoute toRoute, BuildContext nextContext, {Map<String, Object>? parameters}) {
    // TODO: implement navigate
    if (toRoute is PhotoDetailRoute) {
      // Navigation to ForgotPasswordRouter
      // final commentDetailPage = CommentDetailPage(toRoute.commentId, nav: this,);
      // var commentDetailChild = ChangeNotifierProvider<CommentDetailProvider>.value(value: CommentDetailProvider(), child: commentDetailPage,);
      // Navigator.push(nextContext, PageTransition(child: commentDetailChild, type: PageTransitionType.rightToLeft),);
    }
  }

  @override
  Widget buildDemoAlert() {
    var showAlertPage = ShowAlertPage(router: this,);
    return ChangeNotifierProvider<ShowAlertProvider>.value(value: ShowAlertProvider(), child: showAlertPage,);
  }

  @override
  Widget buildDemoLayout() {
    var showDemoPage = ShowLayoutPage(router: this,);
    return ChangeNotifierProvider<ShowLayoutProvider>.value(value: ShowLayoutProvider(), child: showDemoPage,);
  }

}