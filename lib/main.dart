import 'package:diabetesapp/constants/routes.dart';
import 'package:diabetesapp/services/auth/auth_service.dart';
import 'package:diabetesapp/views/landingPage.dart';
import 'package:diabetesapp/views/home_view.dart';
import 'package:diabetesapp/views/login_view.dart';
import 'package:diabetesapp/views/register_view.dart';
import 'package:diabetesapp/views/verify_email_view.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diabetes App',
      home: const LogicPage(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF9FAFC)
      ),
      routes: {
        loginRoute:(context) => const LoginView(),
        registerRoute:(context) => const RegisterView(),
        homeRoute:(context) => const HomePage(),
        verifyEmailRoute:(context) => const VerifyEmailPage(),



      },
    );
  }
}

class LogicPage extends StatelessWidget {
  const LogicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.IsEmailVerified) {
                return const HomePage();
              } else {
                return const VerifyEmailPage();
              }
            } else {
              return const LandingView();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
