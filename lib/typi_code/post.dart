

import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {

  int? userId;
  int? id;
  String? body;
  String? title;

  Post({this.userId, this.id, this.body, this.title});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);


  /**

  Real code
factory Post.fromJson(Map<String, dynamic> json)
  {
    return Post(
      userId: json["userId"],
      postId: json['id'],
      title: json["title"],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson()=>
      {
        'userId': userId,
        'id': postId,
        'title': title,
        'body': body,
      };



  * */

}