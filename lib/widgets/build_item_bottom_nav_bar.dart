import 'package:flutter/material.dart';

extension ColorUtils on Color {
  Color? mix(Color another, double amount) {
    return Color.lerp(this, another, amount);
  }
}

class BuildNavItem extends StatelessWidget {
  final Icon icon;
  final Color? color;
  const BuildNavItem({this.color, required this.icon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? Theme.of(context).backgroundColor;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: Container(
          // padding: const EdgeInsets.all(5),
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            //color: Color(0xff333333),
            borderRadius: BorderRadius.circular(50),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.mix(Colors.black, .1) ?? Colors.black,
                color,
                color,
                // Color.fromARGB(255, 145, 145, 145),
                // Color.fromARGB(255, 100, 97, 97),
                color.mix(Colors.white, .5) ?? Colors.white,
              ],
              stops: const [
                0.0,
                0.4,
                0.7,
                1.0,
              ],
            ),
            boxShadow: boxShadowGray,
          ),
          child: Container(
            width: double.maxFinite / 2,
            height: double.maxFinite / 2,
            color: Colors.transparent,
            alignment: Alignment.center,
            transformAlignment: Alignment.center,
            child: Container(
              //color: Colors.grey[300],
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}

const List<BoxShadow> boxShadowGray = [
  BoxShadow(
    color: Color.fromARGB(160, 86, 86, 86),
    offset: Offset(-24.5, -24.5),
    blurRadius: 75,
    spreadRadius: 3.0,
  ),
  BoxShadow(
    color: Color.fromARGB(160, 16, 16, 16),
    offset: Offset(24.5, 24.5),
    blurRadius: 75,
    spreadRadius: 3.0,
  ),
];

final List<BoxShadow> boxShadowBorder = [
  const BoxShadow(
    color: Colors.white38,
    offset: Offset(-2.0, -2.0),
    blurRadius: 1.5,
    spreadRadius: 0.375,
  ),
  BoxShadow(
    color: Colors.grey.shade600,
    offset: const Offset(2.0, 2.0),
    blurRadius: 1.5,
    spreadRadius: 0.375,
  ),
];
