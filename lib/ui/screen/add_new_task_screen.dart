import 'package:flutter/material.dart';
import 'package:untitled/ui/widgets/screen_backgrount.dart';
import 'package:untitled/ui/widgets/tm_app_bar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  static const String name = '/add-new-task';

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _titelTEcontroller = TextEditingController();
  final TextEditingController _descriptionTEcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _descriptionTEcontroller,
                    maxLines: 8,
                    decoration: const InputDecoration(hintText: 'Description'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.arrow_circle_right_outlined,
                      color: Colors.white,
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

  @override
  void dispose() {
    _titelTEcontroller.dispose();
    _descriptionTEcontroller.dispose();
    super.dispose();
  }
}

