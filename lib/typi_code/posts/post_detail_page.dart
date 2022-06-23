/*
 * Created with IntelliJ IDEA
 * Package: widget
 * User: admin
 * Email: duc@propzy.com
 * Date: 6/22/22 - 12:41 AM
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';
import 'package:simple_auth_1/commons/coordinator/constants.dart';
import 'package:simple_auth_1/typi_code/posts/post_detail_provider.dart';
import '../../commons/base_statefull_widget.dart';
import '../../widget/platform_progress.dart';
import '../post.dart';

//ignore: must_be_immutable
class PostDetailPage extends BaseStateFulWidget {
  int postId;

  PostDetailPage(this.postId, {Key? key, DbNavigation? nav}) : super(key: key, nav: nav);
  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends BaseState<PostDetailPage, PostDetailProvider> {

  @override
  void initState() {
    super.initState();

  }

  @override
  getAppBar(BuildContext context) {
    return "Detail Post Id: ${widget.postId} ";
  }

  @override
  Widget getBody(BuildContext context) {
    // Bat dau load
    if (pageProvider.isLoading) {
      pageProvider.loadData(widget.postId);
      return const Center(child: PlatformProgress());
    }

    // load xong, kiem tra gia tri
    var post = pageProvider.post;
    if (post == null) {
      return const Center(child: Text("Loi khi load du lieu hay khong co du lieu"));
    }

    // Co du lieu, hien thi du lieu
    return Column(
      children: [
        Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("#Post - ${post.id}", style: const TextStyle(fontSize: 12, color: Colors.blue)),
                  Container(
                    margin: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Text(
                      post.title.toString(),
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          height: 1.35
                      ),
                    ),
                  ),
                  Text(post.body.toString(), style: const TextStyle(
                      height: 1.35
                  )),
                ],
              ),
            )
        )
      ],
    );
  }
}
