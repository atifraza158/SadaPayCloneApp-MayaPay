import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maya_pay/screens/set_your_pin(text).dart';
import 'package:maya_pay/utils/fonts.dart';
import 'package:maya_pay/utils/helpers.dart';
import 'package:maya_pay/widgets/extensions/colors_extensions.dart';
import 'package:maya_pay/widgets/extensions/textstyles_extensions.dart';
import 'package:maya_pay/widgets/pin_input_field.dart';
import 'package:sizer/sizer.dart';

class VerifyPhoneNumberScreen extends StatefulWidget {
  static const id = 'VerifyPhoneNumberScreen';

  final String phoneNumber;

  const VerifyPhoneNumberScreen({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<VerifyPhoneNumberScreen> createState() =>
      _VerifyPhoneNumberScreenState();
}

class _VerifyPhoneNumberScreenState extends State<VerifyPhoneNumberScreen>
    with WidgetsBindingObserver {
  bool isKeyboardVisible = false;

  late final ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomViewInsets = WidgetsBinding.instance.window.viewInsets.bottom;
    isKeyboardVisible = bottomViewInsets > 0;
  }

  // scroll to bottom of screen, when pin input field is in focus.
  Future<void> _scrollToBottomOnKeyboardOpen() async {
    while (!isKeyboardVisible) {
      await Future.delayed(const Duration(milliseconds: 50));
    }

    await Future.delayed(const Duration(milliseconds: 250));

    await scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FirebasePhoneAuthHandler(
      phoneNumber: widget.phoneNumber,
      signOutOnSuccessfulVerification: false,
      sendOtpOnInitialize: true,
      linkWithExistingUser: false,
      autoRetrievalTimeOutDuration: const Duration(seconds: 60),
      otpExpirationDuration: const Duration(seconds: 60),
      onCodeSent: () {
        log(VerifyPhoneNumberScreen.id, msg: 'OTP sent!');
      },
      onLoginSuccess: (userCredential, autoVerified) async {
        log(
          VerifyPhoneNumberScreen.id,
          msg: autoVerified
              ? 'OTP was fetched automatically!'
              : 'OTP was verified manually!',
        );

        showSnackBar('Phone number verification successfully!');

        log(
          VerifyPhoneNumberScreen.id,
          msg: 'Login Success UID: ${userCredential.user?.uid}',
        );

        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return SetYourPinTextOnly();
          },
        ));
      },
      onLoginFailed: (authException, stackTrace) {
        log(
          VerifyPhoneNumberScreen.id,
          msg: authException.message,
          error: authException,
          stackTrace: stackTrace,
        );

        switch (authException.code) {
          case 'invalid-phone-number':
            // invalid phone number
            return showSnackBar('Invalid phone number!');
          case 'invalid-verification-code':
            // invalid otp entered
            return showSnackBar('The entered OTP is invalid!');
          // handle other error codes
          default:
            showSnackBar('Something went wrong!');
          // handle error further if needed
        }
      },
      onError: (error, stackTrace) {
        log(
          VerifyPhoneNumberScreen.id,
          error: error,
          stackTrace: stackTrace,
        );

        showSnackBar('An error occurred!');
      },
      builder: (context, controller) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.lightBlue.shade700,
                Colors.lightBlue,
              ],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: controller.isSendingCode
                ? null
                : AppBar(
                    backgroundColor: Colors.transparent, elevation: 0,
                    leading: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: whiteColor,
                      ),
                    ),
                    // title: const Text('Verify Phone Number'),
                    // actions: [
                    //   if (controller.codeSent)
                    //     TextButton(
                    //       onPressed: controller.isOtpExpired
                    //           ? () async {
                    //               log(VerifyPhoneNumberScreen.id,
                    //                   msg: 'Resend OTP');
                    //               await controller.sendOTP();
                    //             }
                    //           : null,
                    //       child: Text(
                    //         controller.isOtpExpired
                    //             ? 'Resend'
                    //             : '${controller.otpExpirationTimeLeft.inSeconds}s',
                    //         style:
                    //             const TextStyle(color: Colors.blue, fontSize: 18),
                    //       ),
                    //     ),
                    //   const SizedBox(width: 5),
                    // ],
                  ),
            body: controller.isSendingCode
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: SizedBox(
                          width: 50.sp,
                          height: 50.sp,
                          child: Stack(
                            children: [
                              Center(
                                child: SizedBox(
                                  width: 50.sp,
                                  height: 50.sp,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/logo.png',
                                  ),
                                  color: Colors.white,
                                  width: 30.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Text(
                        "Sending verification code...!",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                : ListView(
                    padding: EdgeInsets.all(20),
                    controller: scrollController,
                    children: [
                      SizedBox(
                        height: 10.sp,
                      ),
                      Text(
                        "Enter verification code",
                        style: TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Text(
                        "We've sent it to +${widget.phoneNumber.substring(1, 3)}-${widget.phoneNumber.substring(3, 6)}-${widget.phoneNumber.substring(6)}",
                        style: TextStyle(fontSize: 12.sp, color: whiteColor),
                      ),
                      SizedBox(
                        height: 40.sp,
                      )
                      // if (controller.isListeningForOtpAutoRetrieve)
                      //   Column(
                      //     children: const [
                      //       CustomLoader(),
                      //       SizedBox(height: 50),
                      //       Text(
                      //         'Listening for OTP',
                      //         textAlign: TextAlign.center,
                      //         style: TextStyle(
                      //           fontSize: 25,
                      //           fontWeight: FontWeight.w600,
                      //         ),
                      //       ),
                      //       SizedBox(height: 15),
                      //       Divider(),
                      //       Text('OR', textAlign: TextAlign.center),
                      //       Divider(),
                      //     ],
                      //   ),
                      // const SizedBox(height: 15),
                      ,
                      PinInputField(
                        length: 6,
                        onFocusChange: (hasFocus) async {
                          if (hasFocus) await _scrollToBottomOnKeyboardOpen();
                        },
                        onSubmit: (enteredOtp) async {
                          final verified =
                              await controller.verifyOtp(enteredOtp);
                          if (verified) {
                            // number verify success
                            // will call onLoginSuccess handler
                          } else {
                            // phone verification failed
                            // will call onLoginFailed or onError callbacks with the error
                          }
                        },
                      ),
                    ],
                  ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.fromLTRB(
                20.sp,
                0,
                20.sp,
                30.sp,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (controller.codeSent)
                    GestureDetector(
                      onTap: controller.isOtpExpired
                          ? () async {
                              log(VerifyPhoneNumberScreen.id,
                                  msg: 'Resend OTP');
                              await controller.sendOTP();
                            }
                          : null,
                      child: controller.isOtpExpired
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Didn't get the code?",
                                  style: TextStyle(
                                    color: whiteColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.sp,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Resend verfication code ",
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_rounded,
                                      color: whiteColor,
                                    )
                                  ],
                                ),
                              ],
                            )
                          : Text(
                              "Resend available in ${controller.otpExpirationTimeLeft.inSeconds} seconds",
                              style: TextStyle(
                                color: whiteColor,
                              ),
                            ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
