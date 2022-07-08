

import 'package:simple_auth_1/api/post_api.dart';

import '../../commons/base_provider.dart';
import 'package:simple_auth_1/models/post.dart';

class PostDetailProvider extends BaseProvider {

  PostDetailProvider() {
    isLoading = true;
  }

  Post? post;

  void loadData(int postId) async {

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

    // isLoading = true;
    PostApi().getPost(postId).then((value) {
      isLoading = false;
      post = value;
      notifyListeners();
    });


  }

}