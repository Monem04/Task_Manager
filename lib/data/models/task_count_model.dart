import 'dart:convert';

class TaskCountModel {
  String? sld;
  int? sum;

  TaskCountModel({this.sld, this.sum});

  TaskCountModel.fromJson(Map<String, dynamic> json) {
    sld = json['_id'];
    sum = json['sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sld;
    data['sum'] = sum;
    return data;
  }
}
