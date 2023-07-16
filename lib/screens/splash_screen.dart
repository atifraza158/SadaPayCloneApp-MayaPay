import 'package:flutter/material.dart';
import 'package:maya_pay/screens/authentication_screen.dart';
import 'package:maya_pay/screens/home_screen.dart';
import 'package:maya_pay/utils/globals.dart';
// import 'package:maya_pay/widgets/custom_loader.dart';

class SplashScreen extends StatefulWidget {
  static const id = 'SplashScreen';

  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    (() async {
      await Future.delayed(Duration(seconds: 5));
      final isLoggedIn = Globals.firebaseUser != null;

      if (!mounted) return;
      Navigator.pushReplacementNamed(
        context,
        isLoggedIn ? HomeScreen.id : AuthenticationScreen.id,
      );
    })();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.lightBlue.shade700,
              Colors.lightBlue,
            ],
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(
                  'assets/images/logo.png',
                ),
                color: Colors.white,
                width: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'MAYA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'Pay',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              )
            ],
          ),
        ),
      ),
      // body: CustomLoader(),
    );
  }
}
