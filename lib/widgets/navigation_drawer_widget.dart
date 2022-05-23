import 'package:flutter/material.dart';
import 'package:motorparts_marketplace/providers/navigation_provider.dart';
import 'package:provider/provider.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final NavigationProvider navigationProvider;
  const NavigationDrawerWidget({required this.navigationProvider, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var safeArea = EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top);
    final bool isCollapsed = navigationProvider.navigationDrawerIsCollapsed;
    const padding = EdgeInsets.symmetric(vertical: 20);
    return SizedBox(
      width: isCollapsed
          ? MediaQuery.of(context).size.width * 0.75
          : MediaQuery.of(context).size.width * 0.25,
      //null,
      child: Drawer(
        backgroundColor: const Color.fromARGB(255, 180, 152, 168),
        elevation: 100,
        child: Column(
          children: [
            Container(
                padding: padding.add(safeArea),
                width: double.infinity,
                color: Colors.white12,
                child: BuildHeader(
                  isCollapsed: isCollapsed,
                )),
            const SizedBox(height: 20),
            const Spacer(),
            BuildCollapseIcon(
              buildContext: context,
              isCollapsed: isCollapsed,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class BuildMenuItem extends StatelessWidget {
  final bool isCollapsed;
  final String text;
  final IconData icon;
  final VoidCallback? onTap;
  const BuildMenuItem(
      {Key? key,
      required this.isCollapsed,
      required this.text,
      required this.icon,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    final leading = Icon(icon, color: color);
    return Material(
      color: Colors.transparent,
      child: isCollapsed
          ? ListTile(
              title: leading,
              onTap: onTap,
            )
          : ListTile(
              leading: leading,
              title: Text(text, style: TextStyle(color: color)),
              onTap: onTap,
            ),
    );
  }
}

class BuildCollapseIcon extends StatelessWidget {
  final bool isCollapsed;
  final BuildContext buildContext;
  BuildCollapseIcon(
      {Key? key, required this.buildContext, required this.isCollapsed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double size = 52;
    final icon = !isCollapsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios;
    final Alignment alignment =
        isCollapsed ? Alignment.center : Alignment.centerRight;
    final EdgeInsets margin = EdgeInsets.only(right: isCollapsed ? 0 : 20);
    final double width = isCollapsed ? double.infinity : size;

    return Container(
      alignment: alignment,
      margin: margin,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: SizedBox(
            width: width,
            height: size,
            child: Icon(icon),
          ),
          onTap: () {
            final provider =
                Provider.of<NavigationProvider>(context, listen: false);
            provider.toggleNavigationDrawerIsCollapsed();
          },
        ),
      ),
    );
  }
}

class BuildHeader extends StatelessWidget {
  final bool isCollapsed;

  BuildHeader({required this.isCollapsed, Key? key}) : super(key: key);
  // ImageProvider logoColumn =
  //     const AssetImage('assets/logos_app/complete_logo_column.png');
  // ImageProvider logoRow =
  //     const AssetImage('assets/logos_app/complete_logo_row.png');

  @override
  Widget build(BuildContext context) {
    return !isCollapsed
        ? const ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            child: FlutterLogo(),
            // Image(
            //   image: logoColumn,
            //   fit: BoxFit.cover,
            //   width: MediaQuery.of(context).size.width * 0.25,
            // ),
          )
        : Row(
            children: [
              const SizedBox(width: 24),
              const ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                child: FlutterLogo(),
                // Image(
                //   image: logoColumn,
                //   fit: BoxFit.cover,
                //   width: MediaQuery.of(context).size.width * 0.25,
                // ),
              ),
              const SizedBox(width: 24),
              Text(
                "Nombre de la tienda",
                style: TextStyle(
                    fontSize: 24 /
                        ((MediaQuery.of(context).devicePixelRatio /
                                MediaQuery.of(context).textScaleFactor) *
                            0.75),
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          );
  }
}
