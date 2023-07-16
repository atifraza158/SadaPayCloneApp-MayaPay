import 'package:easy_container/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:maya_pay/screens/verify_phone_number_screen.dart';
import 'package:maya_pay/utils/helpers.dart';
import 'package:maya_pay/widgets/common_text_field.dart';
import 'package:maya_pay/widgets/extensions/colors_extensions.dart';
import 'package:maya_pay/widgets/extensions/textstyles_extensions.dart';
import 'package:sizer/sizer.dart';

class AuthenticationScreen extends StatefulWidget {
  static const id = 'AuthenticationScreen';

  const AuthenticationScreen({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _formKey = GlobalKey<FormState>();

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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.lightBlue.shade700,
                Colors.lightBlue,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80.sp,
              ),
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: Text(
                  "Let's get started!",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.sp),
                child: Text(
                  "Please enter your mobile number",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 15),
              EasyContainer(
                elevation: 0,
                borderRadius: 10,
                color: Colors.transparent,
                child: Form(key: _formKey, child: phoneTextField()
                    // IntlPhoneField(
                    //   autofocus: true,
                    //   invalidNumberMessage: 'Invalid Phone Number!',
                    //   textAlignVertical: TextAlignVertical.center,
                    //   onChanged: (phone) => phoneNumber = phone.completeNumber,
                    //   initialCountryCode: 'PK',
                    //   cursorColor: Color.fromRGBO(10, 172, 173, 1),
                    //   flagsButtonPadding:
                    //       EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    //   showDropdownIcon: false,
                    //   dropdownIconPosition: IconPosition.trailing,
                    //   dropdownTextStyle: TextStyle(fontSize: 14),
                    //   showCountryFlag: true,
                    //   dropdownIcon: Icon(
                    //     Icons.arrow_drop_down_rounded,
                    //     color: Colors.black,
                    //   ),
                    //   dropdownDecoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(50),
                    //   ),
                    //   keyboardType: TextInputType.phone,
                    // ),
                    ),
              ),
              // SizedBox(height: 15),
              // EasyContainer(
              //   width: double.infinity,
              //   onTap: () async {
              // if (isNullOrBlank(phoneController.text) ||
              //     !_formKey.currentState!.validate()) {
              //   showSnackBar('Please enter a valid phone number!');
              // } else {
              //   Navigator.pushNamed(
              //     context,
              //     VerifyPhoneNumberScreen.id,
              //     arguments: "+92" + phoneController.text,
              //   );
              // }
              //   },
              //   child: Text(
              //     'Verify',
              //     style: TextStyle(fontSize: 18),
              //   ),
              // ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.fromLTRB(
            10.sp,
            0,
            10.sp,
            20.sp,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 10,
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.sp),
                )),
            onPressed: () {
              if (isNullOrBlank(phoneController.text) ||
                  !_formKey.currentState!.validate()) {
                showSnackBar('Please enter a valid phone number!');
              } else {
                Navigator.pushNamed(
                  context,
                  VerifyPhoneNumberScreen.id,
                  arguments: "+92" + phoneController.text,
                );
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 10.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
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
    );
  }

  TextEditingController phoneController = TextEditingController();

  Widget phoneTextField() {
    return CommonTextField(
      label: "Phone Number",
      controller: phoneController,
      suffixIcon: Padding(
        padding: EdgeInsets.only(top: 12.sp),
        child: Text(
          '*',
          textAlign: TextAlign.end,
          style: TextStyle(color: color.themeColor),
        ),
      ),
      prefixText: true,
      inputType: TextInputType.phone,
      isPhoneFormatter: true,
      maxLength: true,
      validator: (val) {
        if (val?.isEmpty ?? false) {
          print("val?.length");
          print(val?.length != 10);
          return "Phone number required";
        } else if (val?.length != 10) {
          return "Phone number required";
        }
      },
    );
  }
}
