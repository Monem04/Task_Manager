import 'package:flutter/material.dart';
import 'package:untitled/ui/screen/add_new_task_screen.dart';
import 'package:untitled/ui/widgets/screen_backgrount.dart';
import '../widgets/task_item_widget.dart';
import '../widgets/task_status_summary_color_widget.dart';
import '../widgets/tm_app_bar.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBr(),
      body: ScreenBackgrount(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTsaksSummaryByStatus(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _buildTaskListView(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {
            Navigator.pushNamed(context, AddNewTaskScreen.name);
          },
              child: const Icon(Icons.add)),
    );
  }

  Widget _buildTaskListView() {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const taskItemWidget();
      },
    );
  }

  Widget _buildTsaksSummaryByStatus() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            TaskStatusSummaryCounterWidget(
              titel: 'new',
              count: '12',
            ),
            TaskStatusSummaryCounterWidget(
              titel: 'Progress',
              count: '12',
            ),
            TaskStatusSummaryCounterWidget(
              titel: 'Completed',
              count: '12',
            ),
            TaskStatusSummaryCounterWidget(
              titel: 'Cancelled',
              count: '12',
            ),
          ],
        ),
      ),
    );
  }
}
