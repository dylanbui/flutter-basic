/*
 * Created with IntelliJ IDEA
 * Package: widget
 * User: admin
 * Email: duc@propzy.com
 * Date: 6/22/22 - 12:34 AM
 * To change this template use File | Settings | File Templates.
 */

import 'package:simple_auth_1/typi_code/comment.dart';

import 'package:flutter/material.dart';
import 'package:simple_auth_1/commons/base_statefull_widget.dart';
import 'package:simple_auth_1/commons/coordinator/constants.dart';

import 'comment_detail_provider.dart';

//ignore: must_be_immutable
class CommentDetailPage extends BaseStateFulWidget {
  CommentDetailPage({Key? key, DbNavigation? nav}) : super(key: key, nav: nav);

  @override
  State<CommentDetailPage> createState() => _CommentDetailPageState();
  // cho nay khac voi nhung cho khac

  // @override
  // State<StatefulWidget> createState() {
  //   return _CommentListPageState();
  // }

}

class _CommentDetailPageState extends BaseState<CommentDetailPage, CommentDetailProvider> {

  late Comment comment;

  @override
  void initState() {
    super.initState();

  }



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
                  Text("#Comment - ${comment.id}", style: const TextStyle(fontSize: 12, color: Colors.blue)),
                  Container(
                    margin: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Text(
                      comment.name.toString(),
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          height: 1.35
                      ),
                    ),
                  ),
                  Text(comment.body.toString(), style: const TextStyle(
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


