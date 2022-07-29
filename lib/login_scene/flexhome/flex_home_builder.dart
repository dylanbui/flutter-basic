/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 26/07/2022 - 10:52
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_builder.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';

import 'interactor/flex_home_page.dart';
import 'interactor/flex_home_provider.dart';

// Listener

// Route

class FlexHomeRoute extends DbNoteRoute {
  FlexHomeRoute();
}

// Buildable

abstract class FlexHomeBuildable extends DbNoteBuildable {

  Widget build();

}

// Builder

class FlexHomeBuilder extends DbNoteBuilder with DbNoteRouter implements FlexHomeBuildable {

  @override
  Widget build() {
    var googleMapPage = FlexHomePage(router: this,);
    rootPage = ChangeNotifierProvider<FlexHomeProvider>.value(value: FlexHomeProvider(), child: googleMapPage,);
    return rootPage;
  }

  // FlexHomeBuildable
  @override
  void navigate(DbNoteRoute toRoute, BuildContext nextContext, {Map<String, Object>? parameters}) {

  }

}
 
 

