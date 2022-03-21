import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:flutter/material.dart';

import 'widgets/background_twitter.dart';
import 'widgets/links_bar.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Theme(
        data: ThemeData.light().copyWith(
            scrollbarTheme: const ScrollbarThemeData()
                .copyWith(thumbColor: MaterialStateProperty.all(Colors.white))),
        child: Scrollbar(
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              size.width > 1000
                  ? _DesktopBody(child: child)
                  : _MobileBody(child: child),
              const LinksBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {
  const _MobileBody({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const CustomTitle(),
          SizedBox(
            width: double.infinity,
            height: 420,
            child: child,
          ),
          const SizedBox(
            width: double.infinity,
            height: 400,
            child: BackgroundTwitter(),
          )
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  const _DesktopBody({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * .95,
      color: Colors.black,
      child: Row(
        children: [
          const Expanded(child: BackgroundTwitter()),
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                const SizedBox(height: 20),
                const CustomTitle(),
                const SizedBox(height: 50),
                Expanded(child: child),
              ],
            ),
          )
        ],
      ),
    );
  }
}
