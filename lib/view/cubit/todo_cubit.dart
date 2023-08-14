part of '../../utils/import-pass/import_pass.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial()) {
    getMyUsers();
  }

  List<ToDoModel> toDoList = [];
  getMyUsers() async {
    try {
      emit(TodoLoading());
      toDoList = await ToDoService().getTodo();
      emit(TodoSuccess());
    } catch (e) {
      emit(TodoError());
    }
  }
}
