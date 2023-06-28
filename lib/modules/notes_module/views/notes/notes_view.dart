import 'package:flutter/material.dart';

import '../../controller/notes_controller.dart';

class NotesView extends StatelessWidget {
  final NotesController controller;

  const NotesView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Text('Notes'),
    );
  }
}