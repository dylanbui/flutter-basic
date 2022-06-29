

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_auth_1/commons/base_statefull_widget.dart';
import 'package:simple_auth_1/commons/coordinator/constants.dart';
import 'package:simple_auth_1/typi_code/photos/photo_list_provider.dart';
import 'package:simple_auth_1/typi_code/photos/shared/photo_list_item.dart';
import 'package:simple_auth_1/utils/logger.dart';

import '../../widget/platform_progress.dart';
import '../photo.dart';

class PhotoListPage extends BaseStateFulWidget {

  final String title = "Photo List Page";

  PhotoListPage({Key? key, DbNavigation? nav}) : super(key: key, nav: nav);

  @override
  State<StatefulWidget> createState() {
    return _PhotoListPageState();
  }

}

class _PhotoListPageState extends BaseState<PhotoListPage, PhotoListProvider> {


  @override
  void initState() {
    // Hãy lưu ý rằng bên trong phương thức initState(){...},
    // chúng ta có một Provider nhưng chúng ta đã khai báo listen: false
    // vì chúng ta không thể gán vào một active listener bên trong phương thức này.

    // Provider.of<PhotoListProvider>(context, listen: false);
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
  List<Widget> getAppBarAction() {
    return <Widget>[
      IconButton(
        icon: const Icon(Icons.notifications),
        onPressed: () {
          eLog("click : Icons.notifications");
        },
      ),
      IconButton(
        icon: const Icon(Icons.person),
        onPressed: () {
          eLog("click : Icons.person");
        },
      ),
    ];
  }


  @override
  Widget getBody(BuildContext context) {
    // _postListProvider = Provider.of<PostListProvider>(context);
    // _postListProvider.firstLoad();
    pageProvider.firstLoad();
    // Lang nghe su thay doi tu bien
    // pageProvider.addListener(() {});

    //return super.getBody(context);
    // return _buildPostsList(context, _postListProvider.itemList);
    return _buildPhotosList(context, pageProvider.itemList);
  }

  Widget _buildPhotosList(BuildContext context, List<Photo> postList) {
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
                    return PhotoListItem(postList[index]);
                    // return _buildPhotoItem(context, postList[index], index);
                  },
              ),
            ),
          ),
          if (pageProvider.isLoadMore) const PlatformProgress()
        ],
      );
    }
  }

  Widget _buildPhotoItem(BuildContext context, Photo photo, int index) {

    // NetworkImage(photo.thumbnailUrl ?? "https://picsum.photos/250?image=9")

    // FadeInImage.memoryNetwork(
    //   placeholder: kTransparentImage,
    //   image: 'https://picsum.photos/250?image=9',);

    var image = CachedNetworkImage(
      imageUrl: photo.thumbnailUrl!,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fitHeight,),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );



    return InkWell(
      onTap: () {}, // Handle your onTap
      child: Ink(
        height: 250,
        child: image,
      ),
    );

    return SizedBox(
      height: 150,
      child: image,
    );

    // Cach 1
    // return Container(
    //   width: 180,
    //   height: 139,
    //   margin: const EdgeInsets.all(5),
    //   child: FadeInImage.memoryNetwork(
    //     placeholder: kTransparentImage,
    //     image: 'https://picsum.photos/250?image=9',),
    // );


    // return ListTile(
    //   title: Text(
    //     "${index.toString()}: " + photo.title.toString(),
    //     style: const TextStyle(fontWeight: FontWeight.bold),
    //   ),
    //   subtitle: Text(photo.title ?? ""),
    //   onTap: () {
    //     eLog("GestureDetector index : ${index.toString()}");
    //     eLog("Post id : ${photo.id.toString()}");
    //     widget.nav?.navigate(PostDetailRouter(photo.id ?? 4), context);
    //   },
    // );

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