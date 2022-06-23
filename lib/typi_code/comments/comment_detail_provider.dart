

import 'package:simple_auth_1/commons/base_load_more_refresh_provider.dart';
import 'package:simple_auth_1/commons/base_proviver.dart';

import '../../api/comment_api.dart';
import '../comment.dart';


class CommentDetailProvider extends BaseProvider {

  Comment? comment;

  CommentDetailProvider() {
    isLoading = true;
  }

  void loadData(int commentId) async {

    CommentApi().getComment(commentId).then((value) {
      isLoading = false;
      comment = value.item1;
      notifyListeners();
    });


  }

}