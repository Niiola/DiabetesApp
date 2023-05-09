import 'package:diabetesapp/views/tool.dart';
import 'package:flutter/material.dart';
import '../constants/routes.dart';
import '../enums/menu_action.dart';
import '../services/auth/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 375.45,
            height: 195.21,
            child: Image.asset(
              'assets/header.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 340,
            height: 80,
            child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.yellow,
                ),
                onPressed: () async {},
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text('Glucose'),
                        Text('last read was at ...')
                      ],
                    ),
                    Row(
                      children: const [Text('10.2')],
                    )
                  ],
                )
                // 'Sign In',
                // style: TextStyle(
                //   color: Colors.white,
                //   fontSize: 18,
                // ),
                ),
          ),
          Row(
            children: [
              Container(
                width: 159,
                height: 65.82,
                child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.yellow,
                    ),
                    onPressed: () async {},
                    child: const Text(
                      'Care Team',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    )),
              ),
              Container(
                width: 159,
                height: 65.82,
                child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.yellow,
                    ),
                    onPressed: () async {},
                    child: const Text(
                      'INPUT BLOOD GLUCOSE LEVEL',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    )),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: const Toolbar(),
    );
  }
}

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('sign out'),
          content: const Text('Are you sure you want to sign out'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('log out'),
            ),
          ],
        );
      }).then((value) => value ?? false);
}
