import 'package:flutter/material.dart';
import 'package:untitled/data/models/task_count_by_status.dart';
import 'package:untitled/data/models/task_count_model.dart';
import 'package:untitled/data/models/task_list_by_status_model.dart';
import 'package:untitled/data/services/network_caller.dart';
import 'package:untitled/data/utils/urls.dart';
import 'package:untitled/ui/screen/add_new_task_screen.dart';
import 'package:untitled/ui/widgets/centered_circuler_progress_indicator.dart';
import 'package:untitled/ui/widgets/screen_backgrount.dart';
import 'package:untitled/ui/widgets/snak_bar_message.dart';
import '../widgets/task_item_widget.dart';
import '../widgets/task_status_summary_color_widget.dart';
import '../widgets/tm_app_bar.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {
  bool _getTaskCountByStatusInProgress = false;
  bool _getNewTaskListInProgress = false;
  TaskCountByStatusModel? taskCountByStatusModel;
  TaskListByStatusModel? newTaskListModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getTaskCountByStatus();
    _getNewTaskList;
  }

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
                child: Visibility(
                    visible: _getNewTaskListInProgress == false,
                    replacement: CenteredCirculerProgressIndicator(),
                    child: _buildTaskListView()),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AddNewTaskScreen.name);
          },
          child: const Icon(Icons.add)),
    );
  }

  Widget _buildTaskListView() {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: newTaskListModel?.taskList?.length ?? 0,
      itemBuilder: (context, index) {
        return taskItemWidget(
          taskModel: newTaskListModel!.taskList![index],
        );
      },
    );
  }

  Widget _buildTsaksSummaryByStatus() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Visibility(
        visible: _getTaskCountByStatusInProgress == false,
        replacement: CircularProgressIndicator(),
        child: Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  primary: false,
                  shrinkWrap: true,
                  itemCount: taskCountByStatusModel?.taskByStatusList?.length ?? 0,
                  itemBuilder: (context, index) {
                    final TaskCountModel model = taskCountByStatusModel!.taskByStatusList![index];
                    return TaskStatusSummaryCounterWidget(
                      titel: model.sld ?? '',
                      count: model.sum.toString(),
                    );
                  },
              ),
            )),
      ),
    );
  }

  Future<void> _getTaskCountByStatus() async {
    _getTaskCountByStatusInProgress = true;
    setState(() {});
    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.taskCountByStatusUrl);
    if (response.isSuccess) {
      taskCountByStatusModel =
          TaskCountByStatusModel.fromJson(response.responseData!);
    } else {
      showSnakBarMessage(context, response.errorMessage);
    }
    _getTaskCountByStatusInProgress = false;
    setState(() {});
  }

  Future<void> _getNewTaskList() async {
    _getNewTaskListInProgress = true;
    setState(() {});
    final NetworkResponse response =
    await NetworkCaller.getRequest(url: Urls.taskListByStatusUrl('New'));
    if (response.isSuccess) {
      newTaskListModel =
          TaskListByStatusModel.fromJson(response.responseData!);
    } else {
      showSnakBarMessage(context, response.errorMessage);
    }
    _getNewTaskListInProgress = false;
    setState(() {});
  }
}
