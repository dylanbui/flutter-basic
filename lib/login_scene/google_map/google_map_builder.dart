/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 14/07/2022 - 15:59
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_builder.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';
import 'package:simple_auth_1/login_scene/google_map/interactor/google_map_page.dart';
import 'package:simple_auth_1/login_scene/google_map/interactor/google_map_provider.dart';

// Listener

// Route

class GoogleMapRoute extends DbNoteRoute {
  GoogleMapRoute();
}

// Buildable

abstract class GoogleMapBuildable extends DbNoteBuildable {

  Widget build();

}

// Builder

class GoogleMapBuilder extends DbNoteBuilder with DbNoteRouter implements GoogleMapBuildable {

  @override
  Widget build() {
    var googleMapPage = GoogleMapPage(router: this,);
    rootPage = ChangeNotifierProvider<GoogleMapProvider>.value(value: GoogleMapProvider(), child: googleMapPage,);
    return rootPage;
  }

  // GoogleMapBuildable
  @override
  void navigate(DbNoteRoute toRoute, BuildContext nextContext, {Map<String, Object>? parameters}) {

  }

}
 
 

