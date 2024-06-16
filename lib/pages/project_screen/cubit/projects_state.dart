


import 'package:equatable/equatable.dart';

abstract class ProjectState extends Equatable{
  const ProjectState();
}

class ProjectInitialState extends ProjectState{
  @override
  List<Object> get props => [];
}
class ProjectErrorState extends ProjectState {
  final String message;

  ProjectErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class ProjectSuccessState extends ProjectState {
  final String message;

  ProjectSuccessState(this.message);

  @override
  List<Object> get props => [message];
}