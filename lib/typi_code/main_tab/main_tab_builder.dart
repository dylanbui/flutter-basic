/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 04/07/2022 - 16:00
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_builder.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';
import 'package:simple_auth_1/typi_code/photos/photo_builder.dart';

import 'main_tab_provider.dart';
import 'main_tab_page.dart';

// Listener

// Buildable

abstract class MainTabBuildable extends DbNoteBuildable {

  Widget build();

}

// Route

class PhotoRoute extends DbNoteRoute { }
class AlertRoute extends DbNoteRoute { }
class LayoutRoute extends DbNoteRoute { }

// Builder


class MainTabBuilder extends DbNoteBuilder with DbNoteRouter implements MainTabBuildable {

  @override
  Widget build() {
    var mainTabPage = MainTabPage(router: this,);
    rootPage = ChangeNotifierProvider<MainTabProvider>.value(value: MainTabProvider(), child: mainTabPage,);
    return rootPage;

  }

  @override
  void navigate(DbNoteRoute toRoute, BuildContext nextContext, {Map<String, Object>? parameters}) {
    if (toRoute is PhotoRoute) {
      PhotoBuildable photoBuilder = PhotoBuilder();
      push(nextContext, photoBuilder.build());

    } else if (toRoute is AlertRoute) {
      // PhotoBuildable photoBuilder = PhotoBuilder();
      // push(nextContext, photoBuilder.build());

    } else if (toRoute is LayoutRoute) {
      // PhotoBuildable photoBuilder = PhotoBuilder();
      // push(nextContext, photoBuilder.build());
    }


  }

}