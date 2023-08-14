part of '../../utils/import-pass/import_pass.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: BlocConsumer<TodoCubit, TodoState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is TodoLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TodoError) {
            return const Center(
              child: Text("Error"),
            );
          }
          return ListView.builder(
              itemCount: context.watch<TodoCubit>().toDoList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text((context.watch<TodoCubit>().toDoList[index].id).toString()),
                  title: Text(context.watch<TodoCubit>().toDoList[index].title ?? '--'),
                  trailing: Text((context.watch<TodoCubit>().toDoList[index].completed).toString()),
                );
              });
        },
      ),
    );
  }
}
