import 'package:diabetesapp/views/tool.dart';
import 'package:flutter/material.dart';

class DietPlanView extends StatefulWidget {
  const DietPlanView({super.key});

  @override
  State<DietPlanView> createState() => _DietPlanViewState();
}

class _DietPlanViewState extends State<DietPlanView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: const Toolbar(),
    );
  }
}
