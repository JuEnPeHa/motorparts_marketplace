import 'package:flutter/material.dart';

class OverlayBackgroundScaffoldWidget extends StatelessWidget {
  final Widget child;
  final bool isOverlay;
  const OverlayBackgroundScaffoldWidget({
    super.key,
    required this.child,
    this.isOverlay = true,
  });

  @override
  Widget build(BuildContext context) {
    return isOverlay
        ? Overlay(
            clipBehavior: Clip.antiAlias,
            initialEntries: [
              OverlayEntry(
                builder: (context) => Material(
                  color: Colors.transparent,
                  child: SafeArea(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      child: child,
                    ),
                  ),
                ),
              ),
            ],
          )
        : Scaffold(
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
            body: SafeArea(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: child,
                ),
              ),
            ),
          );
  }
}
