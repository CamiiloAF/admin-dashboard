import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../ui/views/dashboard_view.dart';
import '../ui/views/login_view.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(handlerFunc: (context, __) {
    final authProvider = Provider.of<AuthProvider>(context!);

    return authProvider.authStatus == AuthStatus.notAuthenticated
        ? const LoginView()
        : const DashboardView();
  });
}
