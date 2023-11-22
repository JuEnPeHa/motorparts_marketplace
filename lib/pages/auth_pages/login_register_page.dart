import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:motorparts_marketplace/widgets/login_or_register_header_widget.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obsureText,
  });

  final TextEditingController controller;
  final String hintText;
  final bool obsureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: TextField(
          controller: controller,
          obscureText: obsureText,
          decoration: InputDecoration(
            // border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            fillColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.50),
            filled: true,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyLarge,
          ),
        ));
  }
}

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({super.key});

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  late final ScrollController _scrollController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return MotorplaceBackgroundScaffold(
      // backgroundColor: Theme.of(context).colorScheme.primary,
      backgroundColor: Colors.white,
      // includeScaffolding: true,
      edgeInsetsGeometry: EdgeInsets.zero,
      child: Container(
        // color: Colors.red,
        child: Stack(
          children: [
            //TODO: Add Lottie animation
            // Positioned.fill(
            //   child: Container(
            //       // color: Colors.black.withOpacity(0.5),
            //       child: Lottie.asset(
            //     jsons.elementAt(5), fit: BoxFit.fitWidth,
            //     // alignment: Alignment.center,
            //   )),
            // ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
                child: const SizedBox(),
              ),
            ),
            Positioned.fill(
              child: Container(
                // color: Colors.blue.withOpacity(0.5),
                child: CustomScrollView(
                  controller: _scrollController,
                  physics: ClampingScrollPhysics(),
                  slivers: [
                    LoginOrRegisterHeader(
                      scrollController: _scrollController,
                      isLogin: true,
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Container(
                              // alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6.0,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              // height: Consts.textFormFieldHeight.toDouble(),
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                  color: Colors.black87,
                                ),

                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  ),
                                  hintText: 'Ingrese su correo electrónico',
                                  hintStyle: TextStyle(
                                    color: Colors.black38,
                                  ),
                                ),
                                // autovalidateMode: AutovalidateMode.onUserInteraction,
                                onChanged: (value) {
                                  print('onChanged0: (value) {' + value + ')');
                                  print('onChanged1: (value) {' +
                                      _emailController.text +
                                      ')');
                                },
                                controller: _emailController,
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              // alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6.0,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              // height: Consts.textFormFieldHeight.toDouble(),
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                  color: Colors.black87,
                                ),

                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  ),
                                  hintText: 'Ingrese su correo electrónico',
                                  hintStyle: TextStyle(
                                    color: Colors.black38,
                                  ),
                                ),
                                // autovalidateMode: AutovalidateMode.onUserInteraction,
                                onChanged: (value) {
                                  print('onChanged0: (value) {' + value + ')');
                                  print('onChanged1: (value) {' +
                                      _emailController.text +
                                      ')');
                                },
                                controller: _emailController,
                                // validator: (value) {
                                //   print('validator: (value) {' +
                                //       (value ?? 0.toString()) +
                                //       ')');
                                //   if (value == null || value.isEmpty) {
                                //     print('Por favor ingrese su correo electrónico');
                                //     return 'Por favor ingrese su correo electrónico';
                                //   } else {
                                //     print('Correo electrónico válido');
                                //     return 'Correo electrónico válido';
                                //   }
                                //   return null;
                                // },
                              ),
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              height: 20.0,
                              child: Row(
                                children: [
                                  Theme(
                                    data: ThemeData(
                                        unselectedWidgetColor: Colors.white),
                                    child: Checkbox(
                                      value: true,
                                      checkColor: Colors.green,
                                      activeColor: Colors.white,
                                      onChanged: (value) {},
                                    ),
                                  ),
                                  const Text(
                                    'Recuérdame',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSans',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Login'),
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              // child: SPButton(
                              //   onTap: () {},
                              //   text: 'LOGIN',
                              //   icon: Icons.login,
                              // ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 25.0),
                              width: double.infinity,
                              height: 100,
                              child: ElevatedButton(
                                onPressed: () {
                                  print('Login Button Pressed');
                                  // UserAuthFun.changeIndex(1, context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  shadowColor: Colors.black,
                                  elevation: 5,
                                  padding: const EdgeInsets.all(15.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                                child: const Text(
                                  'INGRESAR',
                                  style: TextStyle(
                                    color: Color(0xFF527DAA),
                                    letterSpacing: 1.5,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextButton(
                              onPressed: () {},
                              child: Text('Forgot Password?'),
                            ),
                            SizedBox(height: 20),
                            TextButton(
                              onPressed: () {},
                              child: Text('Create Account'),
                            ),
                            SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                print('Sign Up Button Pressed');
                                // Navigator.of(context).push(
                                //   // MaterialPageRoute(
                                //   //     // builder: (context) => const RegisterPage(),
                                //   //     ),
                                // );
                              },
                              child: RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'No tienes una cuenta? ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Regístrate',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          // MyTextField(
                          //   controller: _emailController,
                          //   hintText: 'Email',
                          //   obsureText: false,
                          // ),
                          // MyTextField(
                          //   controller: _passwordController,
                          //   hintText: 'Password',
                          //   obsureText: false,
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final EdgeInsetsGeometry paddingAdaptive = Platform.isAndroid
    ? EdgeInsets.symmetric(horizontal: 16.0)
    : EdgeInsets.symmetric(horizontal: 32.0);

class MotorplaceBackgroundScaffold extends StatelessWidget {
  final Widget child;
  final Widget? bottomNavigationBar;
  final Color backgroundColor;
  final bool includeScaffolding;
  final EdgeInsetsGeometry edgeInsetsGeometry;
  MotorplaceBackgroundScaffold({
    super.key,
    required this.child,
    this.bottomNavigationBar,
    this.backgroundColor = Colors.transparent,
    this.includeScaffolding = true,
    EdgeInsetsGeometry? edgeInsetsGeometry,
  }) : edgeInsetsGeometry = edgeInsetsGeometry ?? paddingAdaptive;

  @override
  Widget build(BuildContext context) {
    print('edgeInsetsGeometry = $edgeInsetsGeometry');
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapDown: (_) {
        FocusScope.of(context).unfocus();
      },
      child: includeScaffolding
          ? Scaffold(
              backgroundColor: backgroundColor,
              body: SafeArea(
                child: Padding(
                  padding: edgeInsetsGeometry,
                  child: child,
                ),
              ),
              bottomNavigationBar: bottomNavigationBar,
            )
          : Padding(
              padding: edgeInsetsGeometry,
              child: child,
            ),
    );
  }
}
