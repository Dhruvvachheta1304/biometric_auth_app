import 'package:biometric_auth_app/routes/app_name.dart';
import 'package:biometric_auth_app/view/home_view.dart';
import 'package:biometric_auth_app/view/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRouteName.loginView:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      case AppRouteName.homeView:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
              body: Container(
            alignment: Alignment.center,
            child: const Text("No Page Route Found"),
          )),
        );
    }
  }
}
