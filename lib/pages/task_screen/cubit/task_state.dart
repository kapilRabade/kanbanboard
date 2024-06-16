


import 'package:equatable/equatable.dart';

abstract class TaskState extends Equatable{
  const TaskState();
}

class TaskInitialState extends TaskState{
  @override
  List<Object> get props => [];
}
class TaskErrorState extends TaskState {
  final String message;

  const TaskErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class TaskSuccessState extends TaskState {
  final String message;

  const TaskSuccessState(this.message);

  @override
  List<Object> get props => [message];
}