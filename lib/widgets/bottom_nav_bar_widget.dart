import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motorparts_marketplace/models/navigation_item.dart';
import 'package:motorparts_marketplace/providers/navigation_provider.dart';
import 'package:motorparts_marketplace/widgets/build_item_bottom_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {Key? key,
      required this.width,
      required this.height,
      required this.listNavItems,
      required this.navigationProvider})
      : super(key: key);
  final double width;
  final double height;
  final List<NavigationItem> listNavItems;
  final NavigationProvider navigationProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        boxShadow: boxShadowBorder,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
        color: Colors.grey[300],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: listNavItems
              .map(
                (i) => InkWell(
                    onTap: () {
                      if (Platform.isAndroid) HapticFeedback.vibrate();
                      if (Platform.isIOS) HapticFeedback.lightImpact();

                      navigationProvider.selectedIndex = (i.index);
                      //navigationProvider.toggleIsCollapsed();
                    },
                    child: BuildNavItem(icon: i.icon)),
              )
              .toList(),
        ),
      ),
    );
  }
}
