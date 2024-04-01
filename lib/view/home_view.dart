import 'package:biometric_auth_app/routes/app_name.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home View"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRouteName.loginView);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text("User authentication done")],
        ),
      ),
    );
  }
}
