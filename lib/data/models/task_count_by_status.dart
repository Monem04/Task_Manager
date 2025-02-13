import 'package:untitled/data/models/task_count_model.dart';

class TaskCountByStatusModel {
  String? status;
  List<TaskCountModel>? taskByStatusList; // Corrected List type

  TaskCountByStatusModel({this.status, this.taskByStatusList});

  TaskCountByStatusModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      taskByStatusList = <TaskCountModel>[]; // Corrected the list type
      json['data'].forEach((v) {
        taskByStatusList!.add(TaskCountModel.fromJson(v)); // Corrected type usage
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.taskByStatusList != null) {
      data['data'] = this.taskByStatusList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
