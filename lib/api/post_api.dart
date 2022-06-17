

import 'package:simple_auth_1/commons/network/network_dio_api.dart';

import '../commons/network/network_constants.dart';
import '../constants.dart';
import '../login/login_provider.dart';
import '../typi_code/post.dart';
import '../utils/tuple.dart';

typedef PostType = Tuple<Post?, BaseError?>;

// Co the dung injection dependency o cho nay voi get_it, de toi uu hoa build, va tao singleton class



class PostApi {

  // region Make Singleton Class
  static final PostApi _singleton = PostApi._internal();
  factory PostApi() {
    return _singleton;
  }

  PostApi._internal(); // Write constructor here  UserApi._internal() { [content] }
  // endregion


  Future<List<Post>?> getPostList({int page = 0, int offset = 5}) async {

    // https://jsonplaceholder.typicode.com/posts?_start=0&_limit=5
    final url = "https://jsonplaceholder.typicode.com/posts?_start=${page.toString()}&_limit=${offset.toString()}";
    // chờ 2 giay , co y lam cham hon
    await Future.delayed(const Duration(seconds: 2));
    // Co the tra ve null
    final List? result = await NetworkDioApi().testCall(url, NetworkType.GET);

    // Phai su dung buoc chuyen doi o day vi khong the dia len api nhu kotlin
    List<Post>? posts = result?.map((json) => Post.fromJson(json)).toList();
    return posts;
  }

  Future<Post?> getPost(int postId) async {
    // https://jsonplaceholder.typicode.com/posts?_start=0&_limit=5
    final url = "https://jsonplaceholder.typicode.com/posts/${postId.toString()}";
    // chờ 2 giay , co y lam cham hon
    // await Future.delayed(const Duration(seconds: 2));
    // Lam 2 cach khac nhau de kiem tra

    final Dictionary? result = await NetworkDioApi().simpleCall(url, type: NetworkType.GET);
    return (result != null) ? Post.fromJson(result) : null;

    // if (result != null) {
    //   return Post.fromJson(result);
    // }
    // return null;
  }

  // Example code
  // Future<LoginType> getPost({int page = 0, int offset = 5}) async {
  //   // https://jsonplaceholder.typicode.com/posts?_start=0&_limit=5
  //   const url = 'https://jsonplaceholder.typicode.com/posts';
  //   // chờ 2 giay , co y lam cham hon
  //   await Future.delayed(const Duration(seconds: 2));
  //   // final List<Post> list = await NetworkDioApi().simpleCall(url, NetworkType.GET);
  //   final Tuple<Post?, BaseError?> result = await NetworkDioApi().hardCall(url, NetworkType.GET);
  //   return const Tuple(null, null);
  // }


}