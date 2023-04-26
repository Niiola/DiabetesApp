import 'package:flutter/material.dart';
import '../constants/routes.dart';
import '../services/auth/auth_service.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify email'),
      ),
      body: Column(children: [
        const Text('Email verification sent. Please verify your email'),
        const Text('if email not recieved yet, press the button below'),
        TextButton(
            onPressed: () async {
              await AuthService.firebase().sendEmailVerification();
            },
            child: const Text('send email verification')),
        TextButton(
          onPressed: () async {
            await AuthService.firebase().logOut();
            Navigator.of(context)
                .pushNamedAndRemoveUntil(registerRoute, (route) => false);
          },
          child: const Text('ReStart'),
        )
      ]),
    );
  }
}
