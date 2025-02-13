import 'package:flutter/material.dart';
import 'package:untitled/data/services/network_caller.dart';
import 'package:untitled/data/utils/urls.dart';
import 'package:untitled/ui/widgets/screen_backgrount.dart';
import 'package:untitled/ui/widgets/snak_bar_message.dart';
import 'package:untitled/ui/widgets/tm_app_bar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  static const String name = '/add-new-task';

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _titelTEcontroller = TextEditingController();
  final TextEditingController _descriptionTEcontroller =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _addNewTaskInProgress = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: TMAppBr(),
      body: ScreenBackgrount(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  Text(
                    'Add new task',
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _titelTEcontroller,
                    decoration: const InputDecoration(hintText: 'title'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your title here';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _descriptionTEcontroller,
                    maxLines: 8,
                    decoration: const InputDecoration(hintText: 'Description'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your description here';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Visibility(
                    visible: _addNewTaskInProgress == false,
                    replacement: CircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _clearTextField();
                        }
                      },
                      child: Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _creatNewTask() async {
    _addNewTaskInProgress = true;
    setState(() {});
    Map<String, dynamic> requestBody = {
      "title": _titelTEcontroller.text.trim(),
      "description": _descriptionTEcontroller.text.trim(),
      "status": "New"
    };
    final NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.createTasknUrl, body: requestBody);
    _addNewTaskInProgress = true;
    setState(() {});
    if (response.isSuccess){
      _clearTextField();
      showSnakBarMessage(context, 'New task Added');
    }else{
      showSnakBarMessage(context, response.errorMessage);
    }
  }

  void _clearTextField() {
    _titelTEcontroller.clear();
    _descriptionTEcontroller.clear();
  }

  @override
  void dispose() {
    _titelTEcontroller.dispose();
    _descriptionTEcontroller.dispose();
    super.dispose();
  }
}
