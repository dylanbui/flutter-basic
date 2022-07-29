/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 26/07/2022 - 13:52
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_builder.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';

import 'interactor/open_web_view_page.dart';
import 'interactor/open_web_view_provider.dart';

// Listener

// Route

class OpenWebViewRoute extends DbNoteRoute {
  OpenWebViewRoute();
}

// Buildable

abstract class OpenWebViewBuildable extends DbNoteBuildable {

  Widget build();

}

// Builder

class OpenWebViewBuilder extends DbNoteBuilder with DbNoteRouter implements OpenWebViewBuildable {

  @override
  Widget build() {
    var openWebViewPage = OpenWebViewPage(router: this,);
    rootPage = ChangeNotifierProvider<OpenWebViewProvider>.value(value: OpenWebViewProvider(), child: openWebViewPage,);
    return rootPage;
  }

  // OpenWebViewBuildable
  @override
  void navigate(DbNoteRoute toRoute, BuildContext nextContext, {Map<String, Object>? parameters}) {

  }

}
 
 

