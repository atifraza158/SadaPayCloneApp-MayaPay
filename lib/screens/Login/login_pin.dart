// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maya_pay/screens/personal_information.dart';
import 'package:maya_pay/utils/fonts.dart';

class LoginPinScreen extends StatefulWidget {
  const LoginPinScreen({Key? key}) : super(key: key);

  @override
  _LoginPinScreenState createState() => _LoginPinScreenState();
}

class _LoginPinScreenState extends State<LoginPinScreen> {
  TextEditingController pinController = TextEditingController();
  final FirebaseAuth _authUser = FirebaseAuth.instance;
  late FirebaseFirestore firestore;
  User? _user;

  bool _isLoading = false;

  Future<void> firebaseRef(String pin) async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    FirebaseFirestore.instance.collection("Pin").add({
      'pin': pin,
    }).then((value) {
      Get.offAll(PersonalInformationScreen());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Pin Saved"),
        ),
      );
    }).catchError((e) {
      print(e);
    });
  }

  Future<void> storePin(String pin) async {
    try {
      final userId = _user?.uid;
      DocumentReference documentReference =
          firestore.collection('users').doc(userId);
      await documentReference.update({'pin': pin});
      print('Pin stored in Firestore');
    } catch (error) {
      print('Error storing pin: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    _user = _authUser.currentUser;
    final userId = _user?.uid;
    print(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.lightBlue.shade700,
            Colors.lightBlue,
          ],
        ),
      ),
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 160),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                            child: Image.asset("assets/images/logo.png"),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "MayaPay",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              fontSize: 21,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          width: 260,
                          child: TextFormField(
                            maxLength: 4,
                            style: TextStyle(letterSpacing: 6),
                            keyboardType: TextInputType.phone,
                            textAlign: TextAlign.center,
                            controller: pinController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(21),
                                  borderSide: BorderSide(
                                    color: whiteColor,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(21),
                                  borderSide: BorderSide(
                                    color: whiteColor,
                                  )),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.fingerprint,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "You Can use FingerPrint 😎",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      TextButton(
                        child: Text(
                          "Forgot Pin?",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.fromLTRB(
                10,
                0,
                10,
                20,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onPressed: () {
                  firebaseRef(pinController.text);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: _isLoading,
            child: Container(
              color: Colors.black.withOpacity(0.7),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




//  void _savePinAndNavigate() async {
//     final pin = pinController.text;
//     final userId = _user?.uid;

//     try {
//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(userId)
//           .set({'pin': pin});

//       // Show a snackbar to indicate successful PIN storage
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('PIN saved successfully'),
//         ),
//       );

//       // Navigate to the next screen
//       Get.offAll(PersonalInformationScreen());
//     } catch (e) {
//       // Show an error dialog if there's an issue with PIN storage
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text('Error'),
//           content: Text('Failed to save PIN. Please try again.'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text('OK'),
//             ),
//           ],
//         ),
//       );
//     }
//   }



// onPress of Above Code

//  if (pinController.text.isNotEmpty) {
//                             _savePinAndNavigate();
//                           } else {
//                             showDialog(
//                               context: context,
//                               builder: (context) => AlertDialog(
//                                 title: Text('Error'),
//                                 content: Text('Please enter a PIN.'),
//                                 actions: [
//                                   TextButton(
//                                     onPressed: () => Navigator.pop(context),
//                                     child: Text('OK'),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           }




















// Future<bool> checkBiometrics() async {
  //   final localAuth = LocalAuthentication();
  //   return await localAuth.canCheckBiometrics;
  // }

  // Future<bool> authenticate() async {
  //   final localAuth = LocalAuthentication();
  //   bool authenticated = false;

  //   try {
  //     authenticated = await localAuth.authenticate(
  //         localizedReason: 'Scan your fingerprint to authenticate',
  //         options: AuthenticationOptions(
  //           useErrorDialogs: true,
  //           stickyAuth: true,
  //         ));
  //   } catch (e) {
  //     print(e);
  //   }

  //   return authenticated;
  // }






  // bool biometricsSupported = await checkBiometrics();
                          // if (biometricsSupported) {
                          //   bool authenticated = await authenticate();
                          //   if (authenticated) {
                          //     // Fingerprint authentication succeeded
                          //     print("autenticated");
                          //   } else {
                          //     // Fingerprint authentication failed
                          //     print("Failed");
                          //   }
                          // } else {
                          //   // Fingerprint authentication not supported on this device
                          //   print("Not support by this device");
                          // }
                          // _authenticate();