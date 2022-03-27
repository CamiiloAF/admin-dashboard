import 'package:admin_dashboard/providers/side_menu_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/views/blank_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../services/icons_view.dart';
import '../ui/views/dashboard_view.dart';
import '../ui/views/login_view.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(handlerFunc: (context, __) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.dashboardRoute);

    return authProvider.authStatus == AuthStatus.notAuthenticated
        ? const LoginView()
        : const DashboardView();
  });

  static Handler icons = Handler(handlerFunc: (context, __) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.iconsRoute);

    return authProvider.authStatus == AuthStatus.notAuthenticated
        ? const LoginView()
        : const IconsView();
  });

  static Handler blank = Handler(handlerFunc: (context, __) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.blankRoute);

    return authProvider.authStatus == AuthStatus.notAuthenticated
        ? const LoginView()
        : const BlankView();
  });
}
