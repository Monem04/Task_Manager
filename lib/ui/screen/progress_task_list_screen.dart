import 'package:flutter/material.dart';
import 'package:untitled/ui/widgets/screen_backgrount.dart';
import '../widgets/task_item_widget.dart';
import '../widgets/task_status_summary_color_widget.dart';
import '../widgets/tm_app_bar.dart';

class ProgressTaskListScreen extends StatefulWidget {
  const ProgressTaskListScreen({super.key});

  @override
  State<ProgressTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<ProgressTaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBr(),
      body: ScreenBackgrount(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: _buildTaskListView(),
        ),
      ),
    );
  }

  Widget _buildTaskListView() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        //return const taskItemWidget();
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
