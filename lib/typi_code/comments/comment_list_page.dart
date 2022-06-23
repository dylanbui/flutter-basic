
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:simple_auth_1/commons/base_statefull_widget.dart';
import 'package:simple_auth_1/commons/coordinator/constants.dart';
import 'package:simple_auth_1/typi_code/comment.dart';
import 'package:simple_auth_1/typi_code/comments/comment_coordinator.dart';

import '../../widget/platform_progress.dart';
import 'comment_list_provider.dart';

class CommentListPage extends BaseStateFulWidget {

  final String title = "Comment List Page";

  CommentListPage({Key? key, DbNavigation? nav}) : super(key: key, nav: nav);

  @override
  State<StatefulWidget> createState() {
    return _CommentListPageState();
  }

}

class _CommentListPageState extends BaseState<CommentListPage, CommentListProvider> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  getAppBar(BuildContext context) => widget.title;

  @override
  Widget getBody(BuildContext context) {

    // _postListProvider = Provider.of<PostListProvider>(context);
    // _postListProvider.firstLoad();
    pageProvider.firstLoad();

    // TODO: implement getBody
    //return super.getBody(context);
    // return _buildPostsList(context, _postListProvider.itemList);
    return _buildCommentsList(context, pageProvider.itemList);
  }

  Widget _buildCommentsList(BuildContext context, List<Comment> postList) {
    if (pageProvider.isLoading) {
      return const Center(child: PlatformProgress());
    } else {
      return Column(
        children: <Widget>[
          Expanded(
            child: RefreshIndicator(
              onRefresh: pageProvider.onRefreshListener,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: postList.length,
                  itemBuilder: (BuildContext context, int index) {
                    pageProvider.onScrollListener(index);
                    return _buildPostItem(context, postList[index], index);
                  },
              ),
            ),
          ),
          if (pageProvider.isLoadMore) const PlatformProgress()
        ],
      );
    }
  }

  Widget _buildPostItem(BuildContext context, Comment comment, int index) {
    return GestureDetector(
      onTap: () {
        log("GestureDetector index : ${index.toString()}");
      },
      child: ListTile(
        title: Text(
          "${index.toString()}: " + comment.name.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(comment.body ?? ""),
        onTap: () {
          widget.nav?.navigate(CommentDetailRouter(comment.id ?? 0), context);
        },
      ),
    );
  }


  // Example code
  // Widget _buildPostItem(BuildContext context, Post post, int index) {
  //   return Card(
  //     elevation: 4,
  //     child: ListTile(
  //       title: Text(
  //         "${index.toString()}: " + post.title.toString(),
  //         style: const TextStyle(fontWeight: FontWeight.bold),
  //       ),
  //       subtitle: Text(post.body ?? ""),
  //     ),
  //   );
  // }

  // ListView _buildPosts(BuildContext context, List<Post> posts) {
  //   return ListView.builder(
  //     itemCount: posts.length,
  //     padding: const EdgeInsets.all(8),
  //     itemBuilder: (context, index) {
  //       return Card(
  //         elevation: 4,
  //         child: ListTile(
  //           title: Text(
  //             posts[index].title ?? "",
  //             style: const TextStyle(fontWeight: FontWeight.bold),
  //           ),
  //           subtitle: Text(posts[index].body ?? ""),
  //         ),
  //       );
  //     },
  //   );
  // }



}