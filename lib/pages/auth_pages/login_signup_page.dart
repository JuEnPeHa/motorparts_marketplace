import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:motorparts_marketplace/pages/auth_pages/login_page.dart';
import 'package:motorparts_marketplace/pages/auth_pages/register_page.dart';

class LoginSignupPage extends StatelessWidget {
  const LoginSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      children: const [
        LoginPage(),
        RegisterPage(),
      ],
    );
  }
}
