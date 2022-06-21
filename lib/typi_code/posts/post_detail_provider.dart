

import 'dart:developer';

import 'package:simple_auth_1/api/post_api.dart';
import 'package:simple_auth_1/commons/base_load_more_refresh_provider.dart';
import 'package:simple_auth_1/commons/base_proviver.dart';

import '../post.dart';

class PostDetailProvider extends BaseProvider {


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


    PostApi().getPostList(page: page, offset: 10).then((value) {
      if (value != null) {
        // onLoadSuccess(page, value);
      } else {
        // onLoadFail("Load du lieu bi loi");
      }
    });


  }

}