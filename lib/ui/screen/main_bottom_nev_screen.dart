import 'package:flutter/material.dart';
import 'package:untitled/ui/screen/new_task_list_screen.dart';

class MainBottomNevScreen extends StatefulWidget {
  const MainBottomNevScreen({super.key});

  static const String name = '/home';

  @override
  State<MainBottomNevScreen> createState() => _MainBottomNevScreenState();
}

class _MainBottomNevScreenState extends State<MainBottomNevScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screen = const [
    NewTaskListScreen(),
    NewTaskListScreen(),
    NewTaskListScreen(),
    NewTaskListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index){
          _selectedIndex = index;
          setState(() {});
        },
          destinations: const[
        NavigationDestination(
            icon: Icon(Icons.new_label_outlined), label: 'New'),
        NavigationDestination(
            icon: Icon(Icons.refresh), label: 'Progress'),
        NavigationDestination(
            icon: Icon(Icons.done), label: 'Completed'),
        NavigationDestination(
            icon: Icon(Icons.cabin_outlined), label: 'Canceled'),
      ]),
    );
  }
}
