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
import '../post.dart';

//ignore: must_be_immutable
class PostDetailPage extends BaseStateFulWidget {


  PostDetailPage({Key? key, DbNavigation? nav}) : super(key: key, nav: nav);
  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends BaseState<PostDetailPage, PostDetailProvider> {

  late Post post;

  @override
  Widget build(BuildContext context) {
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
