import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maya_pay/screens/NavigationBar%20Screen/payments_pop.dart';
// import 'package:maya_pay/screens/personal_information.dart';
// import 'package:maya_pay/screens/set_your_pin(text).dart';
import 'package:maya_pay/screens/splash_screen.dart';
import 'package:maya_pay/utils/app_theme.dart';
import 'package:maya_pay/utils/globals.dart';
import 'package:maya_pay/utils/route_generator.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FirebasePhoneAuthProvider(
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'MayaPay',
            scaffoldMessengerKey: Globals.scaffoldMessengerKey,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            onGenerateRoute: RouteGenerator.generateRoute,
            initialRoute: SplashScreen.id,
            // home: PaymentsScreen(),
          );
        },
      ),
    );
  }
}
