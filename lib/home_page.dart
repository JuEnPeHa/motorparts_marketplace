import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motorparts_marketplace/cart_screen.dart';
import 'package:motorparts_marketplace/minor_important_pages/contact.dart';
import 'package:motorparts_marketplace/models/navigation_item.dart';
import 'package:motorparts_marketplace/test_screen.dart';
import 'package:motorparts_marketplace/providers/navigation_provider.dart';
import 'package:motorparts_marketplace/principal_screen.dart';
import 'package:motorparts_marketplace/widgets/build_item_bottom_nav_bar.dart';
import 'package:motorparts_marketplace/widgets/navigation_drawer_widget.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late NavigationProvider navProv;
  late int selectedIndex;

  static final List<Color> _bgColor = [
    Color(0xFF8BDB81),
    Color(0xFF8BDB81),
    Color(0xFF8BDB81),
    Color(0xFF8BDB81),
    Color(0xFF8BDB81),
  ];
  static const List<Icon> _icons = [
    Icon(Icons.home),
    Icon(Icons.search),
    Icon(Icons.settings_backup_restore),
    Icon(CupertinoIcons.shopping_cart),
    Icon(CupertinoIcons.profile_circled),
  ];
  static List<Widget> _screens() => [
        PrincipalScreen(),
        TestScreen(),
        Contact(),
        CartScreen(),
        PrincipalScreen(),
      ];
  static final List<Widget> screens = _screens();
  static List<NavigationItem> navigationItems = [
    for (var i = 0; i < screens.length; i++)
      NavigationItem(
          icon: _icons[i], color: _bgColor[i], title: i.toString(), index: i)
  ];

  @override
  didChangeDependencies() {
    navProv = Provider.of<NavigationProvider>(context);
    selectedIndex = navProv.selectedIndex;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    navProv.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(selectedIndex);
    final bool isCollapsed = navProv.isCollapsed;
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white.withOpacity(0.95),
      body: screens[selectedIndex],
      drawer: NavigationDrawerWidget(navigationProvider: navProv),
      //floatingActionButton: isCollapsed ? null : null,
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Padding(
        padding: isCollapsed
            ? EdgeInsets.only(
                bottom: 20,
                right: (MediaQuery.of(context).size.width / 3) / 2 / 2 * 5,
                left: (MediaQuery.of(context).size.width / 3) / 2 / 2 * 5)
            : const EdgeInsets.only(bottom: 20, right: 50, left: 50),
        child: isCollapsed
            ? ButtonNavBar(
                //width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.075,
                toggle: () {
                  navProv.toggleIsCollapsed();
                },
              )
            : BottomNavBar(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.075,
                listNavItems: navigationItems,
                navigationProvider: navProv,
              ),
      ),
    );
  }
}

class ButtonNavBar extends StatelessWidget {
  const ButtonNavBar({
    Key? key,
    required this.toggle,
    required this.height,
  }) : super(key: key);
  final Function toggle;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height,
      //padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          boxShadow: [
            const BoxShadow(
              color: Colors.white54,
              offset: Offset(-2.5, -2.5),
              blurRadius: 2.0,
              spreadRadius: 0.5,
            ),
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(2.5, 2.5),
              blurRadius: 2.0,
              spreadRadius: 0.5,
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
          color: Colors.grey[300]),
      child: IconButton(
        icon: const Icon(
          Icons.add,
          color: Colors.green,
        ),
        onPressed: () {
          toggle();
        },
        splashColor: Colors.white,
      ),
    );
  }
}

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
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          boxShadow: [
            const BoxShadow(
              color: Colors.white54,
              offset: Offset(-2.5, -2.5),
              blurRadius: 2.0,
              spreadRadius: 0.5,
            ),
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(2.5, 2.5),
              blurRadius: 2.0,
              spreadRadius: 0.5,
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
          color: Colors.grey[300]),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...listNavItems
                .map(
                  (i) => InkWell(
                      onTap: () {
                        if (Platform.isAndroid) {
                          HapticFeedback.vibrate();
                        }
                        if (Platform.isIOS) {
                          HapticFeedback.lightImpact();
                        }
                        navigationProvider.setSelectedIndex(i.index);
                        navigationProvider.toggleIsCollapsed();
                      },
                      child: BuildNavItem(
                        icon: i.icon,
                      )),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
