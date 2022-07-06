/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 04/07/2022 - 15:49
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_builder.dart';
import 'package:simple_auth_1/typi_code/posts/post_list_page.dart';
import 'package:simple_auth_1/typi_code/posts/post_list_provider.dart';
import 'package:simple_auth_1/typi_code/posts/post_router.dart';


// Listener

// Buildable

abstract class PostBuildable extends DbNoteBuildable {

  Widget build({bool showAppBarOnRootPage = true});

}

// Builder


class PostBuilder extends DbNoteBuilder implements PostBuildable {

  // PostBuilder({bool showAppBarOnRootPage = true}) : super() {
  //   var postListPage = PostListPage(router: this,);
  //   postListPage.showAppBar = showAppBarOnRootPage;
  //   rootPage = ChangeNotifierProvider<PostListProvider>.value(value: PostListProvider(), child: postListPage,);
  // }

  // @override
  // void start(BuildContext fromContext) {
  //   Navigator.push(fromContext, PageTransition(child: rootPage, type: PageTransitionType.rightToLeft),);
  // }
  //
  // @override
  // void startSameRootPage(BuildContext fromContext) {
  //   // TODO: implement startSameRootController
  //   // Navigator.pushAndRemoveUntil(buildContext, PageTransition(child: rootPage, type: PageTransitionType.rightToLeft),
  //   //         (route) => route.isFirst == true);
  //
  //   Navigator.pushAndRemoveUntil(fromContext,
  //     PageTransition(child: rootPage,
  //         type: PageTransitionType.rightToLeft,
  //         settings: const RouteSettings(name: "ten")), (route) => false,);
  // }
  //
  // @override
  // void navigate(DbNoteRoute toRoute, BuildContext nextContext, {Map<String, Object>? parameters}) {
  //
  //   if (toRoute is PostDetailRoute) {
  //     final postDetailBuilder = PostDetailBuilder(toRoute.postId);
  //     postDetailBuilder.start(nextContext);
  //   }
  //
  //
  // }

  @override
  Widget build({bool showAppBarOnRootPage = true}) {
    final postRouter = PostRouter();
    var postListPage = PostListPage(router: postRouter,);
    postListPage.showAppBar = showAppBarOnRootPage;
    rootPage = ChangeNotifierProvider<PostListProvider>.value(value: PostListProvider(), child: postListPage,);
    return rootPage;
  }




}