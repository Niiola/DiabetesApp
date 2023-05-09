import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants/routes.dart';
import '../services/auth/auth_exceptions.dart';
import '../services/auth/auth_service.dart';
import '../utilities/show_error_dialog.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController email;
  late final TextEditingController password;
  late final TextEditingController username;
  // String displayName = '';

  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Register"),
            const Text("Create New Account"),
            Container(
              width: 282.0,
              decoration: const BoxDecoration(
                color: const Color(0xFFF9F8FD),
              ),
              child: TextField(
                controller: username,
                keyboardType: TextInputType.text,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'UserName',
                ),
              ),
            ),
            Container(
              width: 282.0,
              child: TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Email',
                ),
              ),
            ),
            Container(
              width: 282.0,
              child: TextField(
                controller: password,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Password',
                ),
              ),
            ),
            TextButton(
                onPressed: () async {
                  final _email = email.text;
                  final _password = password.text;
                  final _username = username.text;

                  try {
                    await AuthService.firebase().createUser(
                      email: _email,
                      password: _password,
                      displayName: _username,
                    );
                    AuthService.firebase().sendEmailVerification();
                    FirebaseAuth auth = FirebaseAuth.instance;
                    final user = auth.currentUser;
                    print(user);
                    Navigator.of(context).pushNamed(verifyEmailRoute);
                  } on WeakPasswordAuthException {
                    await showErrorDialog(
                      context,
                      'Weak Password',
                    );
                  } on EmailAlreadyInUseAuthException {
                    await showErrorDialog(
                      context,
                      'Email Already In Use',
                    );
                  } on InvalidEmailAuthException {
                    await showErrorDialog(
                      context,
                      'invalid email entered',
                    );
                  } on GenericAuthException {
                    await showErrorDialog(
                      context,
                      "Authentication error",
                    );
                  }
                },
                child: const Text('SignUp')),
          ],
        ),
      ),
    );
  }
}
