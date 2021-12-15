import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:to_do_list/src/domain/entities/task.dart';
import 'package:to_do_list/src/presentation/widgets/task_widget.dart';
import 'package:to_do_list/src/utils/constants/colors.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;

  const TasksList({Key? key, required this.tasks})
      : super(key: key);

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print(widget.tasks.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      child: ListView.builder(
        itemCount: widget.tasks.length,
        itemBuilder: (context, index) {
          return TaskWidget(
            isCompleted: widget.tasks[index].isCompleted,
            text: widget.tasks[index].text,
          );
        },
      ),
    );
  }
}
