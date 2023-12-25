import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motorparts_marketplace/pages/auth_pages/bloc/user_auth_bloc.dart';
import 'package:motorparts_marketplace/pages/auth_pages/login_page.dart';
import 'package:motorparts_marketplace/pages/auth_pages/register_page.dart';

class LoginSignupPage extends StatelessWidget {
  // final int index;
  const LoginSignupPage({
    super.key,
    // required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserAuthBloc, UserAuthState>(
      buildWhen: (previous, current) => previous.index != current.index,
      builder: (context, state) {
        return IndexedStack(
          index: state.index,
          children: const [
            LoginPage(),
            RegisterPage(),
          ],
        );
      },
    );
  }
}
