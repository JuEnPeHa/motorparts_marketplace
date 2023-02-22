import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motorparts_marketplace/pages/auth_pages/bloc/user_auth_bloc.dart';
import 'package:motorparts_marketplace/pages/auth_pages/login_signup_page.dart';
import 'package:rive/rive.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  // bool _isLogin = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            const RiveAnimation.asset(
              'assets/rive/shapes.riv',
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
                child: const SizedBox(),
              ),
            ),
            Positioned(
              child: ClipPath(
                  clipper: WaveClipper2(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.50),
                    ),
                  )),
              top: 0,
              left: 0,
              right: 0,
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ClipPath(
                clipper: WaveClipper3(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.50),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: SizedBox.shrink(),
                      ),
                      Icon(
                        Icons.car_repair,
                        color: Colors.white,
                        size: 60,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      BlocBuilder<UserAuthBloc, UserAuthState>(
                        buildWhen: (previous, current) =>
                            previous.index != current.index,
                        builder: (context, state) {
                          return Text(
                            state.index == 0 ? 'Iniciar Sesión' : 'Registrarse',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                            ),
                          );
                        },
                      ),
                      Expanded(
                        flex: 2,
                        child: SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: MediaQuery.of(context).size.height / 3,
              // height: MediaQuery.of(context).size.height / 3 * 2,
              child: LoginSignupPage(
                  // index: _isLogin ? 0 : 1,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.49, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
