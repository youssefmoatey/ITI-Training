part of '../utils/import-pass/import_pass.dart';

// To parse this JSON data, do
//
//     final ToDoModel = ToDoModelFromJson(jsonString);



List<ToDoModel> ToDoModelFromJson(String str) => List<ToDoModel>.from(json.decode(str).map((x) => ToDoModel.fromJson(x)));

String ToDoModelToJson(List<ToDoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ToDoModel {
    int? userId;
    int? id;
    String? title;
    bool? completed;

    ToDoModel({
        this.userId,
        this.id,
        this.title,
        this.completed,
    });

    factory ToDoModel.fromJson(Map<String, dynamic> json) => ToDoModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
    };
}
