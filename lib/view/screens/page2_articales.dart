part of '../../utils/import-pass/import_pass.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List<ToDoModel> todoList = [];
  getMyTodo() async {
    todoList = await ToDoService().getTodo();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getMyTodo();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(todoList[index].title ?? '--'),
            trailing: Text((todoList[index].id).toString()),
          );
        });
  }
}
