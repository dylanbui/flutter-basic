/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 04/07/2022 - 15:52
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_builder.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';
import 'package:simple_auth_1/typi_code/post_detail/post_detail_page.dart';

import 'post_detail_provider.dart';

class PostDetailBuilder extends DbNoteBuilder with DbNoteRouter {

  PostDetailBuilder(int postId) {
    final postDetailPage = PostDetailPage(postId , router: this,);
    rootPage = ChangeNotifierProvider<PostDetailProvider>.value(value: PostDetailProvider(), child: postDetailPage,);
  }

  @override
  void start(BuildContext fromContext) {
    Navigator.push(fromContext,
      PageTransition(child: rootPage,
          settings: const RouteSettings(name: "PostDetailPage"),
          type: PageTransitionType.rightToLeft),);
  }

  @override
  void navigate(DbNoteRoute toRoute, BuildContext nextContext, {Map<String, Object>? parameters}) {

  }





}