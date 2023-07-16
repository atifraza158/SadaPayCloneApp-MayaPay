import 'package:flutter/material.dart';
import 'package:maya_pay/screens/HomeScreens/Cards/banksPages/request_banks.dart';
import 'package:maya_pay/screens/Payments/bills_and_utilities.dart';
import 'package:maya_pay/screens/Payments/mobile_top_ups.dart';
import 'package:maya_pay/utils/fonts.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({super.key});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  List<String> paymentMethods = [
    "Mobile Top-Ups",
    "Bills & Utilities",
    "Money Request",
  ];

  List<String> detailsPaymentsMethods = [
    "Instantly top-up ypur mobile",
    "Pay for your utilities",
    "Review pending money Requests",
  ];

  List<Icon> icons = [
    Icon(Icons.phone_android, color: whiteColor),
    Icon(Icons.blinds_closed_sharp, color: whiteColor),
    Icon(Icons.money_rounded, color: Colors.white),
  ];

  List<Widget> screens = [
    MobileTopUps(),
    BillAndUtilities(),
    RequestBanksScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        toolbarHeight: 80,
        title: Text(
          "Payments",
          style: appBarText,
        ),
      ),
      body: GridView.builder(
        itemCount: 3,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return PaymentMethods(
            title: "${paymentMethods[index]}",
            subtitle: "${detailsPaymentsMethods[index]}",
            onPress: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return screens[index];
                },
              ));
            },
          );
        },
      ),
    );
  }
}

class PaymentMethods extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final VoidCallback? onPress;
  PaymentMethods({super.key, this.title, this.subtitle, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          // height: 300,
          // width: 180,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                offset: Offset(4.0, 4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0,
              )
            ],
            // color: Color(0xffff9190),
            gradient: LinearGradient(
              colors: [
                Color(0xff6f5f90),
                Color(0xff758eb7),

                // Color(0xff138086),
                // Color(0xff534666),
              ],
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  title.toString(),
                  style: acountNamewhiteHeading,
                ),
              ),
              Center(
                child: Text(
                  subtitle.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
