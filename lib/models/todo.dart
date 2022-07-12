/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 08/07/2022 - 11:32
 * To change this template use File | Settings | File Templates.
 */


import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo {

  int? userId;
  int? id;
  String? title;
  bool? completed;

  // "userId": 1,
  // "id": 1,
  // "title": "delectus aut autem",
  // "completed": false

  Todo({this.userId, this.id, this.title, this.completed});

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoToJson(this);

}