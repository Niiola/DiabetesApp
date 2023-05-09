import 'package:diabetesapp/views/tool.dart';
import 'package:flutter/material.dart';

class ReminderView extends StatefulWidget {
  const ReminderView({super.key});

  @override
  State<ReminderView> createState() => _ReminderViewState();
}

class _ReminderViewState extends State<ReminderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Toolbar(),
    );
  }
}
