
part of '../../utils/import-pass/import_pass.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState{}

class TodoSuccess extends TodoState{}

class TodoError extends TodoState{}

