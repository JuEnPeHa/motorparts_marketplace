import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:motorparts_marketplace/pages/auth_pages/bloc/user_auth_bloc.dart';
import 'package:motorparts_marketplace/pages/home_page.dart';

//The height of the Register Page is 2/3 of the screen
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double heightOfThisPage = size.height / 3 * 2;
    // final double freeSpaceInsideThisPage = heightOfThisPage;
    print('heightOfThisPage: $heightOfThisPage');
    // print('freeSpaceInsideThisPage: $freeSpaceInsideThisPage');
    // bool pagePerfect = false; // Less than 5% of free space
    // if (freeSpaceInsideThisPage < (heightOfThisPage * 0.10)) {
    //   pagePerfect = true;
    // }
    return Container(
      height: heightOfThisPage,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 0.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _BuildEmailTF(),
            SizedBox(
              height: heightOfThisPage * 0.05,
            ),
            const _BuildPasswordTF(),
            SizedBox(
              height: heightOfThisPage * 0.05,
            ),
            //Repetir contraseña
            const _BuildPasswordTF(
              isRepeatPassword: true,
            ),
            SizedBox(
              height: heightOfThisPage * 0.025,
            ),
            const _BuildRememberMeCheckbox(),
            SizedBox(
              height: heightOfThisPage * 0.025,
            ),
            const _BuildRegisterBtn(),
            const _BuildSignInWithText(),
            SizedBox(
              height: heightOfThisPage * 0.025,
            ),
            const _BuildSocialBtnRow(),
            SizedBox(
              height: heightOfThisPage * 0.025,
            ),
            const _BuildSignupBtn(),
            SizedBox(
              height: heightOfThisPage * 0.05,
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

//_BuildPasswordTF()
class _BuildPasswordTF extends StatelessWidget {
  final bool isRepeatPassword;
  const _BuildPasswordTF({
    super.key,
    this.isRepeatPassword = false,
  });

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
      child: TextField(
        obscureText: true,
        style: const TextStyle(
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: const Icon(
            Icons.lock,
            color: Colors.black,
          ),
          hintText: isRepeatPassword
              ? 'Repita su contraseña'
              : 'Ingrese su contraseña',
          hintStyle: const TextStyle(
            color: Colors.black38,
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
class _BuildRegisterBtn extends StatelessWidget {
  const _BuildRegisterBtn();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          print('Register Button Pressed');
          UserAuthFun.changeIndex(0, context);
        },
        style: ElevatedButton.styleFrom(
          // primary: Colors.white,
          // onPrimary: Colors.black,
          shadowColor: Colors.black,
          elevation: 5,
          padding: const EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: const Text(
          'REGISTRAR',
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
            'Registrate con',
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
  const _BuildSocialBtnRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BuildSocialBtn(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyHomePage(
                          title: 'Motorparts Marketplace',
                        ))),
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
  final Function()? onTap;
  final AssetImage logo;
  const _BuildSocialBtn({
    super.key,
    this.onTap,
    required this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: Container(
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
              text: 'Ya tienes una cuenta? ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Inicia sesión',
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
