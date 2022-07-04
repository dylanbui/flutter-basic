

import 'package:simple_auth_1/commons/network/network_dio_api.dart';
import 'package:simple_auth_1/models/photo.dart';

import '../commons/network/network_constants.dart';
import '../constants.dart';

import 'package:simple_auth_1/models/post.dart';
import '../utils/tuple.dart';


// Co the dung injection dependency o cho nay voi get_it, de toi uu hoa build, va tao singleton class


class PhotoApi {

  // region Make Singleton Class
  static final PhotoApi _singleton = PhotoApi._internal();
  factory PhotoApi() {
    return _singleton;
  }

  PhotoApi._internal(); // Write constructor here  UserApi._internal() { [content] }
  // endregion


  Future<List<Photo>?> getPhotoList({int page = 0, int offset = 5}) async {
    // https://jsonplaceholder.typicode.com/posts?_start=0&_limit=5
    final url = "https://jsonplaceholder.typicode.com/photos?_start=${page.toString()}&_limit=${offset.toString()}";
    // chờ 2 giay , co y lam cham hon
    await Future.delayed(const Duration(seconds: 2));
    // Co the tra ve null
    final List? result = await NetworkDioApi().testCall(url, NetworkType.GET);

    // Phai su dung buoc chuyen doi o day vi khong the dia len api nhu kotlin
    List<Photo>? photos = result?.map((json) => Photo.fromJson(json)).toList();

    // List<Post>? posts = result?.map((json) {
    //   var p = Post.fromJson(json);
    //   // Kiem tra va xu ly du lieu them o day
    //   return p;
    // }).toList();

    return photos;
  }

  Future<Photo?> getPhoto(int photoId) async {
    // https://jsonplaceholder.typicode.com/posts?_start=0&_limit=5
    final url = "https://jsonplaceholder.typicode.com/photos/${photoId.toString()}";
    // chờ 2 giay , co y lam cham hon
    await Future.delayed(const Duration(seconds: 2));
    // Lam 2 cach khac nhau de kiem tra

    final Dictionary? result = await NetworkDioApi().simpleCall(url, type: NetworkType.GET);
    return (result != null) ? Photo.fromJson(result) : null;
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