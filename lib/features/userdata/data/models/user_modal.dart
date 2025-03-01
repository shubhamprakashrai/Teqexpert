import 'dart:convert';

class UserDataModal {
    final int? userId;
    final int? id;
    final String? title;
    final String? body;

    UserDataModal({
        this.userId,
        this.id,
        this.title,
        this.body,
    });

    factory UserDataModal.fromRawJson(String str) => UserDataModal.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserDataModal.fromJson(Map<String, dynamic> json) => UserDataModal(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
