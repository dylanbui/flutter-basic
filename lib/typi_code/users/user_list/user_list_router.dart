/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 07/07/2022 - 19:34
 * To change this template use File | Settings | File Templates.
 */


import 'package:flutter/material.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';

// Route

class UserListRoute extends DbNoteRoute {
  UserListRoute();
}

// Router

class UserListRouter extends DbNoteRouter {

  @override
  void navigate(DbNoteRoute toRoute, BuildContext nextContext, {Map<String, Object>? parameters}) {
    if (toRoute is Route) {
      // Navigation to Widget
      // push(nextContext, widget);
    }
  }
}