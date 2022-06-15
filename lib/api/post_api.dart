

import '../constants.dart';
import '../login/login_provider.dart';
import '../typi_code/post.dart';
import '../utils/tuple.dart';

typedef PostType = Tuple<Post?, BaseError?>;

class PostApi {

  // region Make Singleton Class
  static final PostApi _singleton = PostApi._internal();
  factory PostApi() {
    return _singleton;
  }

  PostApi._internal(); // Write constructor here  UserApi._internal() { [content] }
  // endregion


  Future<LoginType> getPost(int page, int offset) async {

    // https://jsonplaceholder.typicode.com/posts?_start=0&_limit=5
    const url = 'https://jsonplaceholder.typicode.com/posts';


    // chờ 4 giay
    await Future.delayed(const Duration(seconds: 2));

    // const error = BaseError("Login khong thanh cong");
    // return const Tuple(null, error);

    // try {
    //
    //   final response = await http.get(Uri(url));
    //
    // } catch(error) {
    //
    // }
    return const Tuple(null, null);
  }




}