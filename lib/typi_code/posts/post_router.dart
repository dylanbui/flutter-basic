/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 04/07/2022 - 17:09
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';
import 'package:simple_auth_1/typi_code/post_detail/post_detail_builder.dart';

// Route

class PostDetailRoute extends DbNoteRoute {
  int postId;
  PostDetailRoute(this.postId);
}

// Router

abstract class PostRoutable implements DbNoteRoutable {

  void gotoPostDetail(PostDetailRoute postDetail, BuildContext nextContext);

}

class PostRouter extends DbNoteRouter implements PostRoutable {

  @override
  void gotoPostDetail(PostDetailRoute postDetail, BuildContext nextContext) {
    navigate(postDetail, nextContext);
  }


  @override
  void navigate(DbNoteRoute toRoute, BuildContext nextContext, {Map<String, Object>? parameters}) {

    if (toRoute is PostDetailRoute) {
      final PostDetailBuildable postDetailBuilder = PostDetailBuilder();
      final widget = postDetailBuilder.build(toRoute.postId);
      push(nextContext, widget);
    }

  }


}