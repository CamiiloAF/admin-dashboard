import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:flutter/material.dart';

import '../labels/custom_labels.dart';

class IconsView extends StatelessWidget {
  const IconsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text(
          'Icons View',
          style: CustomLabels.h1,
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
          children: const [
            WhiteCard(
              child: Center(child: Icon(Icons.ac_unit_outlined)),
              title: 'ac_unit_outlined',
              width: 170,
            ),
            WhiteCard(
              child: Center(child: Icon(Icons.access_alarm_outlined)),
              title: 'access_alarm_outlined',
              width: 170,
            ),
            WhiteCard(
              child: Center(child: Icon(Icons.access_time_rounded)),
              title: 'access_time_rounded',
              width: 170,
            ),
            WhiteCard(
              child: Center(child: Icon(Icons.all_inbox_outlined)),
              title: 'all_inbox_outlined',
              width: 170,
            ),
            WhiteCard(
              child: Center(child: Icon(Icons.desktop_mac_sharp)),
              title: 'desktop_mac_sharp',
              width: 170,
            ),
            WhiteCard(
              child: Center(child: Icon(Icons.keyboard_tab_rounded)),
              title: 'keyboard_tab_rounded',
              width: 170,
            ),
            WhiteCard(
              child: Center(child: Icon(Icons.not_listed_location)),
              title: 'not_listed_location',
              width: 170,
            ),
          ],
        )
      ],
    );
  }
}
