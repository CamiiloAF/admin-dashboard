import 'package:admin_dashboard/providers/side_menu_provider.dart';
import 'package:flutter/material.dart';

import 'widgets/navbar_avatar.dart';
import 'widgets/notifications_indicator.dart';
import 'widgets/search_text.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 50,
      decoration: _buildBoxDecoration(),
      child: Row(
        children: [
          if (size.width <= 700)
            IconButton(
              onPressed: () => SideMenuProvider.openMenu(),
              icon: const Icon(Icons.menu_outlined),
            ),
          const SizedBox(
            width: 5,
          ),
          if (size.width > 390)
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const SearchText(),
            ),
          const Spacer(),
          const NotificationsIndicator(),
          const SizedBox(width: 10),
          const NavbarAvatar(),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return const BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 5,
      )
    ]);
  }
}
