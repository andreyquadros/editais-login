// To parse this JSON data, do
//
//     final posts = postsFromMap(jsonString);

import 'dart:convert';

class Posts {
  Posts({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    required this.urlImage
  });

  final int userId;
  final int id;
  final String title;
  final String body;
  final String urlImage;

  Posts copyWith({
    required int userId,
    required int id,
    required String title,
    required String body,
    required String urlImage
  }) =>
      Posts(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
        urlImage: urlImage ?? this.urlImage
      );

  factory Posts.fromJson(String str) => Posts.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Posts.fromMap(Map<String, dynamic> json) => Posts(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
    urlImage: json["urlImage"]
  );

  Map<String, dynamic> toMap() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
    "urlImage": urlImage
  };
}
