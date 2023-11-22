import 'package:flutter/material.dart';

class LoginOrRegisterHeader extends StatelessWidget {
  final ScrollController? scrollController;
  final bool isLogin;
  const LoginOrRegisterHeader({
    super.key,
    this.scrollController,
    this.isLogin = true,
  });

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    const String _tag = 'login_or_register_header';
    return SliverToBoxAdapter(
      child: Hero(
        tag: _tag,
        child: Container(
          height: _size.height * 0.35,
          // color: Colors.white,
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipPath(
                    clipper: WaveClipper2(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.green.withOpacity(0.25),
                    )),
              ),
              Positioned.fill(
                child: ClipPath(
                    clipper: WaveClipper3(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.blue.withOpacity(0.25),
                    )),
              ),
              // Positioned.fill(
              //   child: Container(
              //     child: LayoutBuilder(
              //       builder: (context, constraints) {
              //         return Center(
              //           child: Container(
              //             height: constraints.maxHeight * 0.50,
              //             width: constraints.maxWidth * 0.50,
              //             // color: Colors.red.withOpacity(0.5),
              //             child: Lottie.asset(
              //               jsons.elementAt(0),
              //               fit: BoxFit.fitHeight,
              //               alignment: Alignment.center,
              //             ),
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
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
