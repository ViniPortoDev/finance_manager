import 'package:finance_manager/modules/notes_module/controller/notes_controller.dart';
import 'package:flutter/material.dart';

class GoalView extends StatelessWidget {
  final NotesController controller;
  const GoalView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Text('Goal'),
    );
  }
}
