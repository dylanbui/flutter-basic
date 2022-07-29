/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 27/07/2022 - 09:36
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_builder.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';

import 'interactor/text_editor_page.dart';
import 'interactor/text_editor_provider.dart';

// Listener

// Route

class TextEditorRoute extends DbNoteRoute {
  TextEditorRoute();
}

// Buildable

abstract class TextEditorBuildable extends DbNoteBuildable {

  Widget build();

}

// Builder

class TextEditorBuilder extends DbNoteBuilder with DbNoteRouter implements TextEditorBuildable {

  @override
  Widget build() {
    var textEditorPage = TextEditorPage(router: this,);
    rootPage = ChangeNotifierProvider<TextEditorProvider>.value(value: TextEditorProvider(), child: textEditorPage,);
    return rootPage;
  }

  // TextEditorBuildable
  @override
  void navigate(DbNoteRoute toRoute, BuildContext nextContext, {Map<String, Object>? parameters}) {

  }

}
 
 

