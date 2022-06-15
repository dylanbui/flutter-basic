
import 'package:flutter/material.dart';
import 'package:simple_auth_1/commons/base_statefull_widget.dart';

import '../post.dart';

class PostListPage extends BaseStateFulWidget {

  final String title = "Post List Page";

  const PostListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PostListPageState();
  }

}

class _PostListPageState extends BaseState<PostListPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();





  }

  @override
  String getTitle(BuildContext context) => widget.title;

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return super.getBody(context);
  }


  ListView _buildPosts(BuildContext context, List<Post> posts) {
    return ListView.builder(
      itemCount: posts.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(
              posts[index].title ?? "",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(posts[index].body ?? ""),
          ),
        );
      },
    );
  }



}