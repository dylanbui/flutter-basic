
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_auth_1/commons/base_statefull_widget.dart';
import 'package:simple_auth_1/commons/coordinator/constants.dart';
import 'package:simple_auth_1/typi_code/posts/post_coordinator.dart';
import 'package:simple_auth_1/typi_code/posts/post_list_provider.dart';

import '../../utils/logger.dart';
import '../../widget/platform_progress.dart';
import '../post.dart';

class PostListPage extends BaseStateFulWidget {

  final String title = "Post List Page";

  PostListPage({Key? key, DbNavigation? nav}) : super(key: key, nav: nav);

  @override
  State<StatefulWidget> createState() {
    return _PostListPageState();
  }

}

class _PostListPageState extends BaseState<PostListPage, PostListProvider> {

  // late PostListProvider _postListProvider;

  // @override
  // PostListProvider createProvider(BuildContext context) => Provider.of<PostListProvider>(context);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  // @override
  // void startBuild(BuildContext context) {
  //   _postListProvider = Provider.of<PostListProvider>(context);
  //   _postListProvider.firstLoad();
  // }

  @override
  getAppBar(BuildContext context) => widget.title;


  @override
  Widget getBody(BuildContext context) {
    // _postListProvider = Provider.of<PostListProvider>(context);
    // _postListProvider.firstLoad();
    pageProvider.firstLoad();
    // Lang nghe su thay doi tu bien
    // pageProvider.addListener(() {});

    // TODO: implement getBody
    //return super.getBody(context);
    // return _buildPostsList(context, _postListProvider.itemList);
    return _buildPostsList(context, pageProvider.itemList);
  }

  Widget _buildPostsList(BuildContext context, List<Post> postList) {
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

  Widget _buildPostItem(BuildContext context, Post post, int index) {
    return ListTile(
      title: Text(
        "${index.toString()}: " + post.title.toString(),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(post.body ?? ""),
      onTap: () {
        eLog("GestureDetector index : ${index.toString()}");
        eLog("Post id : ${post.id.toString()}");
        widget.nav?.navigate(PostDetailRouter(post.id ?? 4), context);
      },
    );

    // return GestureDetector(
    //   onTap: () {
    //     log("GestureDetector index : ${index.toString()}");
    //   },
    //   child: ListTile(
    //     title: Text(
    //       "${index.toString()}: " + post.title.toString(),
    //       style: const TextStyle(fontWeight: FontWeight.bold),
    //     ),
    //     subtitle: Text(post.body ?? ""),
    //   ),
    // );
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