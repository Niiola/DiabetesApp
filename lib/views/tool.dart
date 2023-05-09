import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

import '../constants/routes.dart';

class Toolbar extends StatelessWidget {
  const Toolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Container(
      height: 68.63,
      width: 359,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () async {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(homeRoute, (route) => false);
            },
            icon: Image.asset('assets/home.png'),
          ),
          IconButton(
            onPressed: () async {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(reminderRoute, (route) => false);
            },
            icon: Image.asset('assets/reminder.png'),
          ),
          IconButton(
            onPressed: () async {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(recordRoute, (route) => false);
            },
            icon: Image.asset('assets/record.png'),
          ),
          IconButton(
            onPressed: () async {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(dietRoute, (route) => false);
            },
            icon: Image.asset('assets/diet.png'),
          ),
          IconButton(
            onPressed: () async {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(profileRoute, (route) => false);
            },
            icon: Image.asset('assets/profile.png'),
          )
        ],
      ),
    ));
  }
}
