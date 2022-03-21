import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/navigator_service.dart';
import 'package:flutter/material.dart';

import '../services/local_storage.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated,
}

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus _authStatus = AuthStatus.checking;

  AuthStatus get authStatus => _authStatus;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    _token = 'afjaskdjaks';
    LocalStorage.prefs.setString('token', _token!);

    _authStatus = AuthStatus.authenticated;
    notifyListeners();

    NavigatorService.replaceTo(Flurorouter.dashboardRoute);
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      _authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    await Future.delayed(const Duration(seconds: 1));

    _authStatus = AuthStatus.authenticated;
    notifyListeners();

    return true;
  }
}
