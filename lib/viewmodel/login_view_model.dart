import 'package:biometric_auth_app/routes/app_name.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:another_flushbar/flushbar.dart';

class LoginViewModel with ChangeNotifier {
  final LocalAuthentication bioMetricAuth = LocalAuthentication();

  bool _isAvailable = false;
  bool _authenticateResult = false;
  bool get isAvailable => _isAvailable;
  bool get authenticateResult => _authenticateResult;

  checkFingerprintAuth(BuildContext context) async {
    // _isAvailable = await bioMetricAuth.canCheckBiometrics;
    _isAvailable = await bioMetricAuth.isDeviceSupported();
    debugPrint(
        "the Available Bio Metrics in physical device is => $_isAvailable");
    if (_isAvailable) {
      final List<BiometricType> availableBiometrics =
          await bioMetricAuth.getAvailableBiometrics();
      print(availableBiometrics.contains(BiometricType.weak));
      _authenticateResult = await bioMetricAuth.authenticate(
          localizedReason: "Scan Your Fingerprint to process",
          options: const AuthenticationOptions(
              stickyAuth: true, biometricOnly: true));
      if (_authenticateResult) {
        await Future.delayed(const Duration(seconds: 0));
        if (!context.mounted) return;
        Navigator.pushReplacementNamed(context, AppRouteName.homeView);
      }
    } else {
      await Future.delayed(const Duration(seconds: 1));
      if (!context.mounted) return;
      Flushbar(
        message: "Sorry, no BioMetrics Sensor found in your device",
        dismissDirection: FlushbarDismissDirection.VERTICAL,
        blockBackgroundInteraction: true,
        duration: const Duration(seconds: 3),
        animationDuration: const Duration(seconds: 1),
        margin: const EdgeInsets.all(10),
        borderRadius: BorderRadius.circular(10),
        leftBarIndicatorColor: Colors.red,
        backgroundColor: Colors.black.withOpacity(0.8),
        flushbarPosition: FlushbarPosition.BOTTOM,
      ).show(context);
    }
    notifyListeners();
  }
}
