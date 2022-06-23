

import 'package:simple_auth_1/commons/network/network_dio_api.dart';
import 'package:simple_auth_1/typi_code/comment.dart';

import '../commons/network/network_constants.dart';
import '../constants.dart';

import '../utils/tuple.dart';


// Co the dung injection dependency o cho nay voi get_it, de toi uu hoa build, va tao singleton class


class CommentApi {

  // region Make Singleton Class
  static final CommentApi _singleton = CommentApi._internal();
  factory CommentApi() {
    return _singleton;
  }

  CommentApi._internal(); // Write constructor here  UserApi._internal() { [content] }
  // endregion


  Future<ResultType<List<Comment>?>> getCommentList({int page = 0, int offset = 10}) async {
    // https://jsonplaceholder.typicode.com/posts?_start=0&_limit=5
    final url = "https://jsonplaceholder.typicode.com/comments?_start=${page.toString()}&_limit=${offset.toString()}";
    // chờ 2 giay , co y lam cham hon
    await Future.delayed(const Duration(seconds: 2));
    // Co the tra ve null
    final List? result = await NetworkDioApi().simpleCall(url, type: NetworkType.GET);

    // Phai su dung buoc chuyen doi o day vi khong the dia len api nhu kotlin
    List<Comment>? comments = result?.map((json) => Comment.fromJson(json)).toList();

    const error = BaseError(404,"Get comment error");

    return Tuple(comments, comments == null ? error : null);
  }

  Future<ResultType<List<Comment>?>> getCommentListByPostId(int postId) async {
    // https://jsonplaceholder.typicode.com/posts?postId=1
    final url = "https://jsonplaceholder.typicode.com/posts?postId=${postId.toString()}";
    // chờ 2 giay , co y lam cham hon
    // await Future.delayed(const Duration(seconds: 2));
    // Lam 2 cach khac nhau de kiem tra

    // Co the tra ve null
    final List? result = await NetworkDioApi().simpleCall(url, type: NetworkType.GET);

    // Phai su dung buoc chuyen doi o day vi khong the dia len api nhu kotlin
    List<Comment>? comments = result?.map((json) => Comment.fromJson(json)).toList();

    const error = BaseError(404,"Get comment error");

    return Tuple(comments, comments == null ? error : null);
  }

  Future<ResultType<Comment?>> getComment(int commentId) async {
    // https://jsonplaceholder.typicode.com/posts?_start=0&_limit=5
    final url = "https://jsonplaceholder.typicode.com/comments?id=$commentId";
    // Lam 2 cach khac nhau de kiem tra

    final List? result = await NetworkDioApi().simpleCall(url);
    Map<String, dynamic> map = result?.first;
    Comment? comment = (result != null) ? Comment.fromJson(map) : null;
    const error = BaseError(404,"Get comment error");
    // chờ 2 giay , co y lam cham hon
    await Future.delayed(const Duration(seconds: 2));
    return Tuple(comment, comment == null ? error : null);
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