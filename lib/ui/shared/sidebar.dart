import 'package:admin_dashboard/providers/side_menu_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/navigator_service.dart';
import 'package:admin_dashboard/ui/shared/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/menu_item.dart';
import 'widgets/text_separator.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);

    return Container(
      width: 200,
      height: double.infinity,
      decoration: _buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(
            height: 50,
          ),
          const TextSeparator(text: 'main'),
          MenuItem(
            text: 'Dashboard',
            icon: Icons.compass_calibration_outlined,
            onPressed: () => _navigateTo(Flurorouter.dashboardRoute),
            isActive:
                sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
          ),
          MenuItem(
              text: 'Orders',
              icon: Icons.shopping_cart_outlined,
              onPressed: () {}),
          MenuItem(
              text: 'Analytic',
              icon: Icons.show_chart_outlined,
              onPressed: () {}),
          MenuItem(
              text: 'Categories',
              icon: Icons.layers_outlined,
              onPressed: () {}),
          MenuItem(
              text: 'Products',
              icon: Icons.dashboard_outlined,
              onPressed: () {}),
          MenuItem(
              text: 'Discount',
              icon: Icons.attach_money_outlined,
              onPressed: () {}),
          MenuItem(
              text: 'Customers',
              icon: Icons.people_alt_outlined,
              onPressed: () {}),
          const SizedBox(
            height: 30,
          ),
          const TextSeparator(text: 'UI Elements'),
          MenuItem(
            text: 'Icons',
            icon: Icons.list_alt_outlined,
            onPressed: () => _navigateTo(Flurorouter.iconsRoute),
            isActive: sideMenuProvider.currentPage == Flurorouter.iconsRoute,
          ),
          MenuItem(
              text: 'Marketing',
              icon: Icons.mark_email_read_outlined,
              onPressed: () {}),
          MenuItem(
              text: 'Campaign',
              icon: Icons.note_add_outlined,
              onPressed: () {}),
          MenuItem(
            text: 'Blank',
            icon: Icons.post_add_outlined,
            onPressed: () => _navigateTo(Flurorouter.blankRoute),
            isActive: sideMenuProvider.currentPage == Flurorouter.blankRoute,
          ),
          const SizedBox(height: 50),
          MenuItem(
              text: 'Exit', icon: Icons.exit_to_app_outlined, onPressed: () {}),
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF092044),
            Color(0xFF092042),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
          )
        ]);
  }

  void _navigateTo(String routeName) {
    NavigatorService.navigateTo(routeName);
    SideMenuProvider.closeMenu();
  }
}
