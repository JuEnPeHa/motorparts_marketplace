import 'package:flutter/material.dart';
import 'package:motorparts_marketplace/minor_important_pages/contact.dart';
import 'package:motorparts_marketplace/pages/profile/direcciones.dart';
import 'package:motorparts_marketplace/pages/profile/formas_de_pago.dart';

class ProfileOption {
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget route;

  ProfileOption({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.route,
  });

  String get getTitle => title;
  String get getSubtitle => subtitle;
  IconData get getIcon => icon;
  Widget get getRoute => route;

  @override
  String toString() {
    return 'ProfileOption{title: $title, subtitle: $subtitle, icon: $icon, route: $route}';
  }

  CopyWith({
    String? title,
    String? subtitle,
    IconData? icon,
    Widget? route,
  }) {
    return ProfileOption(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      icon: icon ?? this.icon,
      route: route ?? this.route,
    );
  }

  Map toJson() => {
        'title': title,
        'subtitle': subtitle,
        'icon': icon,
        'route': route,
      };

  factory ProfileOption.fromJson(Map<String, dynamic> json) {
    return ProfileOption(
      title: json['title'],
      subtitle: json['subtitle'],
      icon: json['icon'],
      route: json['route'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileOption &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          subtitle == other.subtitle &&
          icon == other.icon &&
          route == other.route;

  @override
  int get hashCode =>
      title.hashCode ^ subtitle.hashCode ^ icon.hashCode ^ route.hashCode;
}

final List<ProfileOption> profileOptions = [
  ProfileOption(
    title: 'Pedidos',
    subtitle: 'Ver tus pedidos',
    icon: Icons.shopping_bag,
    route: Container(),
  ),
  ProfileOption(
    title: 'Direcciones',
    subtitle: 'Administra tus direcciones de envío',
    icon: Icons.location_on,
    route: DireccionesPage(),
  ),
  ProfileOption(
    title: 'Formas de pago',
    subtitle: 'Administra tus formas de pago',
    icon: Icons.credit_card,
    route: FormasDePagoPage(),
  ),
  ProfileOption(
    title: 'Notificaciones',
    subtitle: 'Administra tus notificaciones',
    icon: Icons.notifications,
    route: Container(),
  ),
  ProfileOption(
    title: 'Ayuda',
    subtitle: 'Administra tus ayudas',
    icon: Icons.help,
    route: Contact(),
  ),
  ProfileOption(
    title: 'Cerrar sesión',
    subtitle: 'Administra tus sesiones',
    icon: Icons.logout,
    route: Container(),
  ),
];
