import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban_board/core/ui/theme/theme_manager.dart';
import 'package:kanban_board/di/injection_container.dart';
import 'package:kanban_board/pages/task_screen/cubit/task_cubit.dart';
import 'package:kanban_board/pages/task_screen/view/widget/comment_screen.dart';

class TaskViewWidget extends StatefulWidget {
  String? projectId;
  String? projectName;

  TaskViewWidget({Key? key, this.projectId, this.projectName})
      : super(key: key);

  @override
  _TaskViewWidgetState createState() => _TaskViewWidgetState();
}

class _TaskViewWidgetState extends State<TaskViewWidget> {
  final _taskCubit = sl<TaskCubit>();
  List<Map<String, dynamic>> _tasks = [];
  List<Map<String, dynamic>> _tasksDone = [];
  List<Map<String, dynamic>> _todoTasks = [];
  List<Map<String, dynamic>> _inProgressTasks = [];
  List<Map<String, dynamic>> _doneTasks = [];
  List<Map<String, dynamic>>? tasks=[];

  @override
  void initState() {
    super.initState();
    _fetchTasks();
  }
  Future<void> _fetchTasks() async {
    _tasksDone   =await  _taskCubit.getAllCompletedTask(context, widget.projectId.toString());

    try {

       tasks =

          await _taskCubit.getAllTask(context, widget.projectId.toString());
      for (var task in _tasksDone) {
        tasks!.add(task );
      }

      setState(() {
        _tasks = tasks!.map((task) => {...task, 'status': 'todo'}).toList();
        _categorizeTasks();
      });

    } catch (e) {
      // Handle error
    }
  }

  void _categorizeTasks() {
    _todoTasks = _tasks.where((task) => task['status']   == 'todo'&& task['due'] == null && task['completed_at'] == null).toList();
    _inProgressTasks =
        _tasks.where((task) => task['status'] == 'in_progress'|| task['due'] != null).toList();

    _doneTasks = _tasks.where((task) => task['status'] == 'done'|| task['completed_at'] != null).toList();
  }

  void _createTask(String content) async {
    await _taskCubit.createTask(content, widget.projectId.toString(), context);

    _fetchTasks();
  }

  void _updateTask(String taskId, String content) async {
    await _taskCubit.updateTask(taskId, content, context);
    _fetchTasks();
  }

  void _deleteTask(String taskId) async {
    await _taskCubit.deleteTask(taskId, context);
    setState(() {
      _tasks.removeWhere((task) => task['id'] == taskId);
      _categorizeTasks();
    });
  }

  void _moveTask(Map<String, dynamic> task, String newStatus) {
    setState(() {
      task['status'] = newStatus;
      _categorizeTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.grey,
        title: Text(
          widget.projectName.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: true,
      ),

      body: Row(
        children: [
          Expanded(
            child: _buildColumn('To Do', _todoTasks),
          ),
          Expanded(
            child: _buildColumn('In Progress', _inProgressTasks),
          ),
          Expanded(
            child: _buildColumn('Done', _doneTasks),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? newTaskContent = await _showCreateTaskDialog();
          if (newTaskContent != null) {
            _createTask(newTaskContent);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }




  Widget _buildColumn(String title, List<Map<String, dynamic>> tasks) {
    return Column(
      children: [
        Text(title == 'To Do' ? 'to_do'.tr : title == 'In Progress'?'in_progress'.tr: 'done'.tr,
            style: TextStyle(fontSize: 20)),
        Expanded(
          child: DragTarget<Map<String, dynamic>>(
            onAccept: (receivedTask) async {

              _moveTask(receivedTask, title.toLowerCase().replaceAll(' ', '_'));
              if(title == "To Do"){}
              else if(title == 'In Progress') {


                await _taskCubit.updateTaskToOnProgress(receivedTask["id"]);
             _tasks = [];
            _tasksDone = [];
            _todoTasks = [];
           _inProgressTasks = [];
            _doneTasks = [];
            _fetchTasks();
              }else if(title == 'Done'){
                await _taskCubit.closeTask(receivedTask["id"],context);
                _tasks = [];
                _tasksDone = [];
                _todoTasks = [];
                _inProgressTasks = [];
                _doneTasks = [];
                _fetchTasks();


              }
            },
            onLeave: (onLeave) {

            },
            onMove: (onMove) {

            },
            builder: (context, accepted, rejected) {
              return ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return LongPressDraggable<Map<String, dynamic>>(
                    data: task,
                    feedback: Material(
                      child: SizedBox(
                        width: 60,
                        height: 60,
                        child: Card(
                          child: ListTile(
                            title: Text(task['content']),
                          ),
                        ),
                      ),
                    ),
                    child: Card(
                      child: Column(
                        children: [
                          Text(task['content']),
                          Wrap(
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () async {
                                  String? updatedContent =
                                      await _showEditTaskDialog(
                                          task['content']);
                                  if (updatedContent != null) {
                                    _updateTask(task['id'], updatedContent);
                                  }
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  _deleteTask(task['id']);
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.comment),
                                onPressed: () async {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) =>
                                        CommentBottomSheetView(
                                            task['id'],
                                            _taskCubit
                                        ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],

                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Future<String?> _showCreateTaskDialog() {
    TextEditingController _controller = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('create_task'.tr),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: 'task_content'.tr),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('cancel'.tr),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(_controller.text);
              },
              child: Text('create'.tr),
            ),
          ],
        );
      },
    );
  }

  Future<String?> _showEditTaskDialog(String initialContent) {
    TextEditingController _controller =
        TextEditingController(text: initialContent);
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('edit_task'.tr),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: 'task_content'.tr),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('cancel'.tr),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(_controller.text);
              },
              child: Text('save'.tr),
            ),
          ],
        );
      },
    );
  }
}
