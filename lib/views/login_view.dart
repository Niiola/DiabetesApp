import 'package:flutter/material.dart';
import '../constants/routes.dart';
import '../services/auth/auth_exceptions.dart';
import '../services/auth/auth_service.dart';
import '../utilities/show_error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController email;
  late final TextEditingController password;

  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 38.0,
                color: Color(0xFFA4C76C),
                fontFamily: "inter",
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Login to your account",
              style: TextStyle(
                fontSize: 18.0,
                color: Color(0xFFA2A2A2),
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
            TextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Email',
                prefixIcon: Icon(Icons.mail),
              ),
            ),
            TextField(
              controller: password,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            Container(
              width: 114,
              height: 44,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(12.22),
              //   border: Border.all(
              //     width: 114,
              //     color: Colors.green,
              //   ),
              // ),
              child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.22),
                    ),
                    backgroundColor: Colors.green,
                  ),
                  // ButtonStyle(
                  //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  //     RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(50.0),
                  //     ),
                  //   ),
                  // ),
                  onPressed: () async {
                    final _email = email.text;
                    final _password = password.text;
                    try {
                      await AuthService.firebase().logIn(
                        email: _email,
                        password: _password,
                      );
                      final user = AuthService.firebase().currentUser;
                      if (user?.IsEmailVerified ?? false) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          homeRoute,
                          (route) => false,
                        );
                      } else {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          verifyEmailRoute,
                          (route) => false,
                        );
                      }
                    } on UserNotFoundAuthException {
                      await showErrorDialog(
                        context,
                        'User Not Found',
                      );
                    } on WrongPasswordAuthException {
                      await showErrorDialog(
                        context,
                        'Wrong Credentias',
                      );
                    } on GenericAuthException {
                      await showErrorDialog(
                        context,
                        "Authentication Error",
                      );
                    }
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
