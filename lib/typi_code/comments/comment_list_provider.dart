

import 'package:simple_auth_1/commons/base_load_more_refresh_provider.dart';

import '../../api/comment_api.dart';
import '../comment.dart';


class CommentListProvider extends BaseLoadMoreRefreshProvider<Comment> {


  @override
  void loadData(int page) async {

    // Chay ngon roi
    // PostApi().getPost(4).then((post) {
    //   if (post != null) {
    //     log(post.title.toString());
    //
    //   } else {
    //     log("chay bi loi");
    //   }
    //
    // });


    CommentApi().getCommentList(page: page, offset: 10).then((value) {
      var lstComment = value.item1;
      if (lstComment != null) {
        onLoadSuccess(page, lstComment);
      } else {
        onLoadFail("Load du lieu bi loi: ${value.item2?.code.toString()} -- ${value.item2?.messenger}");
      }
    });


  }

}