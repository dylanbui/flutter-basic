/*
 * Created with IntelliJ IDEA
 * Package: commons.architecture_ribs
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 04/07/2022 - 11:10
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';

abstract class DbNoteRoute {

}

// Ban chat cua implements khhong the co default function, toan bo phai overwrite lai
abstract class DbNoteRouter {

  DbNoteRouter? parentRouter;

  void navigate(DbNoteRoute toRoute, BuildContext nextContext, {Map<String, Object>? parameters});

  void pop(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.pop(context);
    }
  }

}