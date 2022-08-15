/*
 * Created with IntelliJ IDEA
 * Package: commons.architecture_ribs
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 04/07/2022 - 11:10
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

abstract class DbNoteRoute {

}

abstract class DbNoteRouter {

  DbNoteRouter? parentRouter;
  final navigator = GlobalKey<NavigatorState>();

  // DbNoteRouter({this.parentRouter});

  void navigate(DbNoteRoute toRoute, BuildContext nextContext, {Map<String, Object>? parameters});

  // Se tach push, pop qua 1 class khac
  void push(BuildContext fromContext, Widget widget) {
    // Navigator.push(fromContext, PageTransition(child: widget, type: PageTransitionType.rightToLeft),);
    navigator.currentState?.push(PageTransition(child: widget, type: PageTransitionType.rightToLeft));

    // navigator.currentState?.pushAndRemoveUntil(newRoute, (route) => false);

  }

  void pushSameRootPage(BuildContext fromContext, Widget widget) {
    // Navigator.pushAndRemoveUntil(fromContext, PageTransition(child: widget, type: PageTransitionType.rightToLeft), (route) => false);
    navigator.currentState?.pushAndRemoveUntil(PageTransition(child: widget, type: PageTransitionType.rightToLeft), (route) => false);
  }

  void pop(BuildContext context) {
    var currentState = navigator.currentState;
    if (currentState != null) {
      if (currentState.canPop()) {
        currentState.pop();
      }
    }

    // if (Navigator.of(context).canPop()) {
    //   Navigator.pop(context);
    // }
  }

}

/////////////////////////////////////////////

// abstract class DbNoteRoute {
//
// }
//
// // Ban chat cua implements khhong the co default function, toan bo phai overwrite lai
// abstract class DbNoteRouter {
//
//   DbNoteRouter? parentRouter;
//
//   void navigate(DbNoteRoute toRoute, BuildContext nextContext, {Map<String, Object>? parameters});
//
//   void pop(BuildContext context) {
//     if (Navigator.of(context).canPop()) {
//       Navigator.pop(context);
//     }
//   }
//
// }