import 'package:flutter/material.dart';
import 'package:motorparts_marketplace/providers/authentication_service.dart';

class AuthenticationNotifier extends ChangeNotifier {
  final AuthenticationService _authenticationService = AuthenticationService();
}
