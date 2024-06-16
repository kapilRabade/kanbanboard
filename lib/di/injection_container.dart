import 'package:get_it/get_it.dart';
import 'package:kanban_board/pages/project_screen/cubit/projects_cubit.dart';
import 'package:kanban_board/pages/project_screen/data/projects_remote_data_source.dart';
import 'package:kanban_board/pages/project_screen/data/projects_repository.dart';
import 'package:kanban_board/pages/task_screen/cubit/task_cubit.dart';
import 'package:kanban_board/pages/task_screen/data/task_remote_data_source.dart';
import 'package:kanban_board/pages/task_screen/data/task_repository.dart';


//service locator(sl)
final sl = GetIt.instance;

void init(){
/* Cubits */
  sl.registerFactory<ProjectCubitNew>(() => ProjectCubitNew(sl()));
  sl.registerFactory<TaskCubit>(() => TaskCubit(sl()));


  /* Data Sources */

  sl.registerFactory<ProjectRemoteDataSource>(() => ProjectRemoteDataSourceImpl());
  sl.registerFactory<TaskRemoteDataSource>(() => TaskRemoteDataSourceImpl());

  /* Repositories*/
  sl.registerFactory<ProjectRepository>(() => ProjectRepositoryImpl(sl()));
  sl.registerFactory<TaskRepository>(() => TaskRepositoryImpl(sl()));




}

