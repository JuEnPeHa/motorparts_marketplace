import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motorparts_marketplace/pages/auth_pages/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 0.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildEmailTF(),
                const SizedBox(
                  height: 8.0,
                ),
                _buildPasswordTF(),
                const _BuildForgotPasswordBtn(),
                const _BuildRememberMeCheckbox(),
                const _BuildLoginBtn(),
                const _BuildSignInWithText(),
                const _BuildSocialBtnRow(),
                const _BuildSignupBtn(),
              ],
            ),
          ),
        )
      ],
    );
  }
}

//_buildEmailTF
Widget _buildEmailTF() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        height: 40.0,
        child: const TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            // contentPadding: EdgeInsets.all(0.0),
            prefixIcon: Icon(
              Icons.email,
              color: Colors.black,
            ),
            hintText: 'Ingrese su correo electrónico',
            hintStyle: TextStyle(
              color: Colors.black38,
            ),
          ),
        ),
      ),
    ],
  );
}

//_buildPasswordTF
Widget _buildPasswordTF() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        alignment: Alignment.centerLeft,
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
        height: 40.0,
        child: const TextField(
          obscureText: true,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.black,
            ),
            hintText: 'Ingrese su contraseña',
            hintStyle: TextStyle(
              color: Colors.black38,
            ),
          ),
        ),
      ),
    ],
  );
}

// _BuildForgotPasswordBtn
class _BuildForgotPasswordBtn extends StatelessWidget {
  const _BuildForgotPasswordBtn();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          padding: MaterialStateProperty.all(const EdgeInsets.only(right: 0.0)),
        ),
        child: const Text(
          'Olvidó su contraseña?',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
}

// _BuildRememberMeCheckbox
class _BuildRememberMeCheckbox extends StatelessWidget {
  const _BuildRememberMeCheckbox();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      child: Row(
        children: [
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
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
    );
  }
}

// _BuildLoginBtn
class _BuildLoginBtn extends StatelessWidget {
  const _BuildLoginBtn();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => print('Login Button Pressed'),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Colors.black,
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
    );
  }
}

// _BuildSignInWithText
class _BuildSignInWithText extends StatelessWidget {
  const _BuildSignInWithText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          '- O -',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 20.0),
        const Text(
          'Ingresar con',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'OpenSans',
          ),
        ),
      ],
    );
  }
}

// _BuildSocialBtnRow
class _BuildSocialBtnRow extends StatelessWidget {
  const _BuildSocialBtnRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BuildSocialBtn(
            onTap: () => print('Login with Facebook'),
            logo: const AssetImage(
              'assets/logos/facebook.jpg',
            ),
          ),
          _BuildSocialBtn(
            onTap: () => print('Login with Google'),
            logo: const AssetImage(
              'assets/logos/google.jpg',
            ),
          ),
        ],
      ),
    );
  }
}

// _BuildSocialBtn
class _BuildSocialBtn extends StatelessWidget {
  final Function? onTap;
  final AssetImage logo;
  const _BuildSocialBtn({
    super.key,
    this.onTap,
    required this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: Container(
          height: 45.0,
          width: 45.0,
          // decoration: BoxDecoration(
          //   // shape: BoxShape.circle,
          //   color: Colors.white,
          //   borderRadius: BorderRadius.circular(10.0),
          //   boxShadow: [
          //     const BoxShadow(
          //       color: Colors.black26,
          //       offset: Offset(0, 2),
          //       blurRadius: 6.0,
          //     ),
          //   ],
          // ),
          child: CachedNetworkImage(
            imageUrl: 'https://picsum.photos/250?image=9',
          ),
        ),
      ),
    );
  }
}

//_BuildSignupBtn
class _BuildSignupBtn extends StatelessWidget {
  const _BuildSignupBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Sign Up Button Pressed');
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const RegisterPage(),
          ),
        );
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
    );
  }
}
