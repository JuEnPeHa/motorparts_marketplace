import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motorparts_marketplace/pages/auth_pages/bloc/user_auth_bloc.dart';
import 'package:motorparts_marketplace/pages/auth_pages/register_page.dart';

//The height of the Login Page is 2/3 of the screen
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double heightOfThisPage = size.height / 3 * 2;
    final double freeSpaceInsideThisPage = heightOfThisPage -
            40.0 //_BuildEmailTF
            -
            40.0 //_BuildPasswordTF
            -
            20.0 //_BuildForgotPasswordBtn
            -
            20.0 //_BuildRememberMeCheckbox
            -
            100.0 //_BuildLoginBtn
            -
            56.0 //_BuildSignInWithText
            -
            45.0 //_BuildSocialBtnRow
            -
            21.0 //_BuildSignupBtn
            -
            heightOfThisPage * 0.05 //Between _BuildEmailTF and _BuildPasswordTF
            -
            heightOfThisPage *
                0.025 //Between _BuildPasswordTF and _BuildForgotPasswordBtn
            -
            heightOfThisPage *
                0.025 //Between _BuildForgotPasswordBtn and _BuildRememberMeCheckbox
            -
            heightOfThisPage *
                0.05 //Between _BuildRememberMeCheckbox and _BuildLoginBtn
            -
            heightOfThisPage *
                0.05 //Between _BuildSignInWithText and _BuildSocialBtnRow
            -
            heightOfThisPage *
                0.05 //Between _BuildSocialBtnRow and _BuildSignupBtn
            -
            heightOfThisPage *
                0.1 //Between _BuildSignupBtn and bottom of the screen

        ;
    print('heightOfThisPage: $heightOfThisPage');
    print('freeSpaceInsideThisPage: $freeSpaceInsideThisPage');
    bool pagePerfect = false; // Less than 5% of free space
    if (freeSpaceInsideThisPage < (heightOfThisPage * 0.10)) {
      pagePerfect = true;
    }
    return Container(
      // color: pagePerfect ? Colors.green : Colors.red,
      height: heightOfThisPage,
      child: SingleChildScrollView(
        physics: const FixedExtentScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 0.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _BuildEmailTF(),
            SizedBox(
              height: heightOfThisPage * 0.05,
            ),
            _BuildPasswordTF(),
            SizedBox(
              height: heightOfThisPage * 0.025,
            ),
            const _BuildForgotPasswordBtn(),
            SizedBox(
              height: heightOfThisPage * 0.025,
            ),
            const _BuildRememberMeCheckbox(),
            SizedBox(
              height: heightOfThisPage * 0.05,
            ),
            const _BuildLoginBtn(),
            const _BuildSignInWithText(),
            SizedBox(
              height: heightOfThisPage * 0.05,
            ),
            const _BuildSocialBtnRow(),
            SizedBox(
              height: heightOfThisPage * 0.05,
            ),
            const _BuildSignupBtn(),
            SizedBox(
              height: heightOfThisPage * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}

//_BuildEmailTF
class _BuildEmailTF extends StatelessWidget {
  const _BuildEmailTF({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      ),
    );
  }
}

//_BuildPasswordTF
class _BuildPasswordTF extends StatelessWidget {
  const _BuildPasswordTF({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

// _BuildForgotPasswordBtn
class _BuildForgotPasswordBtn extends StatelessWidget {
  const _BuildForgotPasswordBtn();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      height: 20.0,
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
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          print('Login Button Pressed');
          UserAuthFun.changeIndex(1, context);
        },
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
  const _BuildSignInWithText();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            '- O -',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Ingresar con',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
          ),
        ],
      ),
    );
  }
}

// _BuildSocialBtnRow
class _BuildSocialBtnRow extends StatelessWidget {
  const _BuildSocialBtnRow();

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

// _BuildSocialBtn
class _BuildSocialBtn extends StatelessWidget {
  final Function? onTap;
  final AssetImage logo;
  const _BuildSocialBtn({
    this.onTap,
    required this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: SizedBox(
          height: 45.0,
          width: 45.0,
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
