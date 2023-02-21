import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

//The height of the Register Page is 2/3 of the screen
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.blue,
      height: size.height / 3 * 2,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 0.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNameTF(),
            const SizedBox(
              height: 8.0,
            ),
            _buildEmailTF(),
            const SizedBox(
              height: 8.0,
            ),
            _buildPasswordTF(),
            _buildForgotPasswordBtn(),
            _buildRememberMeCheckbox(),
            _BuildRegisterBtn(),
          ],
        ),
      ),
    );
  }
}

//_buildNameTF()
Widget _buildNameTF() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Name',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
      const SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            const BoxShadow(
              color: Colors.black26,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        height: 60.0,
        child: const TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            hintText: 'Enter your Name',
            hintStyle: TextStyle(
              color: Colors.black38,
            ),
          ),
        ),
      ),
    ],
  );
}

//_buildEmailTF()
Widget _buildEmailTF() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Email',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
      const SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            const BoxShadow(
              color: Colors.black26,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        height: 60.0,
        child: const TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.email,
              color: Colors.black,
            ),
            hintText: 'Enter your Email',
            hintStyle: TextStyle(
              color: Colors.black38,
            ),
          ),
        ),
      ),
    ],
  );
}

//_buildPasswordTF()
Widget _buildPasswordTF() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Password',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
      const SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            const BoxShadow(
              color: Colors.black26,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        height: 60.0,
        child: const TextField(
          obscureText: true,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.black,
            ),
            hintText: 'Enter your Password',
            hintStyle: TextStyle(
              color: Colors.black38,
            ),
          ),
        ),
      ),
    ],
  );
}

//_buildForgotPasswordBtn()
Widget _buildForgotPasswordBtn() {
  return Container(
    alignment: Alignment.centerRight,
    child: TextButton(
      onPressed: () => print('Forgot Password Button Pressed'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        )),
        padding: MaterialStateProperty.all(const EdgeInsets.only(right: 0.0)),
      ),
      child: const Text(
        'Forgot Password?',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ),
  );
}

//_buildRememberMeCheckbox()
Widget _buildRememberMeCheckbox() {
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
          'Remember me',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ],
    ),
  );
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
        onPressed: () => print('Register Button Pressed'),
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

//_buildSignInWithText()
Widget _buildSignInWithText() {
  return Column(
    children: [
      const Text(
        '- OR -',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      const SizedBox(height: 20.0),
      const Text(
        'Sign in with',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ],
  );
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
          child: CachedNetworkImage(
            imageUrl: 'https://picsum.photos/250?image=9',
          ),
        ),
      ),
    );
  }
}

//_buildSignupBtn()
Widget _buildSignupBtn() {
  return GestureDetector(
    onTap: () => print('Sign Up Button Pressed'),
    child: RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an Account? ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: 'Sign Up',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
