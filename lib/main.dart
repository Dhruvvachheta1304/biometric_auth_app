import 'package:biometric_auth_app/routes/app_name.dart';
import 'package:biometric_auth_app/routes/app_routes.dart';
import 'package:biometric_auth_app/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(),
        ),
      ],
      child: const MaterialApp(
        title: 'BioMetric Auth',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        initialRoute: AppRouteName.loginView,
        onGenerateRoute: AppRoutes.generateRoutes,
      ),
    );
  }
}
