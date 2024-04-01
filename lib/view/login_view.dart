import 'package:biometric_auth_app/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
    // loginViewModel.checkAuth(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("BioMetric Authentication"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  loginViewModel.checkFingerprintAuth(context);
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),
                    animationDuration: const Duration(seconds: 1),
                    elevation: 10,
                    enableFeedback: true,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.grey[700],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    backgroundColor: Colors.indigo[500]),
                child: const Text("Authenticate")),
          ],
        ),
      ),
    );
  }
}
