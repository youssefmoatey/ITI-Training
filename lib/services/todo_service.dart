part of '../utils/import-pass/import_pass.dart';

class ToDoService {
  String url = 'https://jsonplaceholder.typicode.com/todos';
  getTodo() async {
    List<ToDoModel> toDoList = [];
    final dio = Dio();

    final response = await dio.get(url);
    var data = response.data;
    data.forEach((element) {
      ToDoModel toDoData = ToDoModel.fromJson(element);
      toDoList.add(toDoData);
    });
    return toDoList;
  }
}

