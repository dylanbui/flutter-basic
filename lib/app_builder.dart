
import 'package:flutter/material.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_builder.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';
import 'package:simple_auth_1/login_scene/google_map/google_map_builder.dart';
import 'package:simple_auth_1/login_scene/splash_start/splash_start_builder.dart';
import 'package:simple_auth_1/session_user.dart';
import 'package:simple_auth_1/typi_code/main_tab/main_tab_builder.dart';
import 'package:simple_auth_1/typi_code/todos/todo_list_builder.dart';
import 'package:simple_auth_1/utils/logger.dart';

import 'app.dart';

// Buildable

abstract class AppBuildable extends DbNoteBuildable {

  Widget build();

}


class AppBuilder extends DbNoteBuilder with DbNoteRouter implements AppBuildable, SplashStartListener {


  @override
  Widget build() {
    final SplashStartBuildable splashStartBuilder = SplashStartBuilder();
    rootPage = splashStartBuilder.buildWithListener(this);
    return rootPage;
  }

  @override
  void splashPageComplete(BuildContext currentContext, String? message) {
    // Lay thong tin current user, kiem tra da login chua
    if (App().currentUser.isLogin()) {
      dLog("AppCoordinator -- DA LOGIN ROI");
      dLog(App().currentUser.toString());
    } else {
      dLog("AppCoordinator -- CHUAAAA LOGIN");
    }

    // Sau khi login xong thi chay thang nay
    // final MainTabBuildable mainTabBuilder = MainTabBuilder();
    // final widget = mainTabBuilder.build();

    // final TodoListBuildable todoListBuildable = TodoListBuilder();
    // final widget = todoListBuildable.build();

    final GoogleMapBuildable googleMapBuildable = GoogleMapBuilder();
    final widget = googleMapBuildable.build();


    pushSameRootPage(currentContext, widget);

  }

  @override
  void navigate(DbNoteRoute toRoute, BuildContext nextContext, {Map<String, Object>? parameters}) {

  }


}