/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 08/07/2022 - 11:26
 * To change this template use File | Settings | File Templates.
 */

import 'package:simple_auth_1/commons/network/network_constants.dart';
import 'package:simple_auth_1/commons/network/network_dio_api.dart';
import 'package:simple_auth_1/constants.dart';
import 'package:simple_auth_1/models/todo.dart';

abstract class TodoApi {

  Future<List<Todo>?> getTodoList({int page = 0, int offset = 5});
  Future<Todo?> getTodo(int todoId);

}

class ToDoApiImpl implements TodoApi {

  // region Make Singleton Class
  static final ToDoApiImpl _singleton = ToDoApiImpl._internal();
  factory ToDoApiImpl() {
    return _singleton;
  }

  ToDoApiImpl._internal(); // Write constructor here  UserApi._internal() { [content] }
  // endregion

  @override
  Future<List<Todo>?> getTodoList({int page = 0, int offset = 5}) async {
    // https://jsonplaceholder.typicode.com/todos?_start=0&_limit=5
    final url = "https://jsonplaceholder.typicode.com/todos?_start=${page.toString()}&_limit=${offset.toString()}";
    // chờ 2 giay , co y lam cham hon
    await Future.delayed(const Duration(seconds: 2));
    // Co the tra ve null
    final List? result = await NetworkDioApi().testCall(url, NetworkType.GET);

    // Phai su dung buoc chuyen doi o day vi khong the dia len api nhu kotlin
    List<Todo>? todos = result?.map((json) => Todo.fromJson(json)).toList();

    // List<Post>? posts = result?.map((json) {
    //   var p = Post.fromJson(json);
    //   // Kiem tra va xu ly du lieu them o day
    //   return p;
    // }).toList();

    return todos;
  }

  @override
  Future<Todo?> getTodo(int todoId) async {
    // https://jsonplaceholder.typicode.com/todos?_start=0&_limit=5
    final url = "https://jsonplaceholder.typicode.com/todos/${todoId.toString()}";
    // chờ 2 giay , co y lam cham hon
    await Future.delayed(const Duration(seconds: 2));
    // Lam 2 cach khac nhau de kiem tra

    final Dictionary? result = await NetworkDioApi().simpleCall(url, type: NetworkType.GET);
    return (result != null) ? Todo.fromJson(result) : null;
  }




}