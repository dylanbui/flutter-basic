/*
 * Created with IntelliJ IDEA
 * Package: widget
 * User: admin
 * Email: duc@propzy.com
 * Date: 6/22/22 - 12:34 AM
 * To change this template use File | Settings | File Templates.
 */

import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';

import 'package:flutter/material.dart';
import 'package:simple_auth_1/commons/base_statefull_widget.dart';

import '../../widget/platform_progress.dart';
import 'comment_detail_provider.dart';

//ignore: must_be_immutable
class CommentDetailPage extends BaseStateFulWidget {

  int commentId;

  CommentDetailPage(this.commentId, {Key? key, DbNoteRouter? router}) : super(key: key, router: router);

  @override
  State<CommentDetailPage> createState() => _CommentDetailPageState();
  // cho nay khac voi nhung cho khac

  // @override
  // State<StatefulWidget> createState() {
  //   return _CommentListPageState();
  // }
}

class _CommentDetailPageState extends BaseState<CommentDetailPage, CommentDetailProvider> {

  @override
  void initState() {
    super.initState();

  }

  @override
  getAppBar(BuildContext context) {
    return "Detail Comment Id: ${widget.commentId} ";
  }

  @override
  Widget getBody(BuildContext context) {
    // Bat dau load
    if (pageProvider.isLoading) {
      pageProvider.loadData(widget.commentId);
      return const Center(child: PlatformProgress());
    }

    // load xong, kiem tra gia tri
    var comment = pageProvider.comment;
    if (comment == null) {
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


