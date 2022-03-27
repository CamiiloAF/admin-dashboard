import 'package:admin_dashboard/providers/side_menu_provider.dart';
import 'package:admin_dashboard/ui/shared/sidebar.dart';
import 'package:flutter/material.dart';

import '../../shared/navbar.dart';

class DashboardLayout extends StatefulWidget {
  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    SideMenuProvider.menuController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFEDF1F2),
      body: Stack(
        children: [
          Row(
            children: [
              if (size.width >= 700) const SideBar(),
              Expanded(
                child: Column(
                  children: [
                    const Navbar(),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: widget.child,
                    )),
                  ],
                ),
              ),
            ],
          ),
          if (size.width < 700)
            AnimatedBuilder(
              builder: (context, _) {
                return Stack(
                  children: [
                    if (SideMenuProvider.isOpen)
                      Opacity(
                        opacity: SideMenuProvider.opacity.value,
                        child: GestureDetector(
                            onTap: () => SideMenuProvider.closeMenu(),
                            child: Container(
                              width: size.width,
                              height: size.height,
                              color: Colors.black26,
                            )),
                      ),
                    Transform.translate(
                      offset: Offset(SideMenuProvider.movement.value, 0),
                      child: const SideBar(),
                    ),
                  ],
                );
              },
              animation: SideMenuProvider.menuController,
            ),
        ],
      ),
    );
  }
}
