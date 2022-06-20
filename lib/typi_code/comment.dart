

import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {

  // "userId": 1,
  // "id": 3,
  // "title": "ea molestias quasi exercitationem repellat qui ipsa sit aut",
  // "body": "et

  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  Comment({this.postId, this.id, this.name, this.email, this.body});

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);


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