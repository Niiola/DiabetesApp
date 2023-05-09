import 'package:diabetesapp/views/tool.dart';
import 'package:flutter/material.dart';

class RecordView extends StatefulWidget {
  const RecordView({super.key});

  @override
  State<RecordView> createState() => _RecordViewState();
}

class _RecordViewState extends State<RecordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Toolbar(),
    );
  }
}
