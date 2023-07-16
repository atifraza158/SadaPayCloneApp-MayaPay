import 'dart:async';

import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:maya_pay/screens/HomeScreens/load_money.dart';
import 'package:maya_pay/screens/authentication_screen.dart';
import 'package:maya_pay/utils/fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final user = FirebaseAuth.instance.currentUser;
  String personName = "Muhammad Atif Raza";

  void shareButton() {
    Share.share("com.example.maya_pay");
  }

  List<String> infoList = [
    "Privacy Policy",
    "Terms & Conditions",
    "Schedule of Charges",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 2), () {
      Center(
        child: CircularProgressIndicator(
          color: lightblueColor,
        ),
      );
    });
  }

  // Future<void> _launchUrl(String _url) async {
  //   if (!await launchUrl(Uri(scheme: _url))) {
  //     throw Exception('Could not launch $_url');
  //   }
  // }

  // void openLink() async {
  //   const url = 'https://sadapay.pk/terms/'; // Replace with your desired link
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  void openUrl(String urlLink) {
    final Uri url = Uri.parse(urlLink);
    launchUrl(url, mode: LaunchMode.externalApplication);
  }

  Future<void> _handleRefresh() async {
    return await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        color: Colors.lightBlue,
        animSpeedFactor: 5,
        backgroundColor: Colors.white,
        showChildOpacityTransition: false,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              offset: Offset(4.0, 4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            )
                          ],
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21),
                          ),
                          elevation: 0,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 23,
                                backgroundColor: Colors.green.shade100,
                                child: Icon(
                                  Icons.person,
                                  color: Colors.green,
                                  size: 30,
                                ),
                              ),
                              title: Text(
                                personName,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Business Account Card with gradient
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              offset: Offset(4.0, 4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            )
                          ],
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21),
                          ),
                          elevation: 0,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Limit",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(.5),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Incoming",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Rs. $leftAmount",
                                        style: TextStyle(
                                          color:
                                              Colors.lightBlue.withOpacity(.5),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 12),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(21),
                                  child: LinearProgressIndicator(
                                    minHeight: 8,
                                    backgroundColor: Colors.grey.shade300,
                                    value: leftAmount /
                                        200000, // Adjust the range as per your requirement
                                    color: Colors.lightBlue,
                                  ),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  "Your Rs. 200k monthly limit resets on the 1st of the next month",
                                  style: TextStyle(color: Colors.black45),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Reward Card / Share Card
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              offset: Offset(4.0, 4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            )
                          ],
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21),
                          ),
                          elevation: 0,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Reward",
                                  style: TextStyle(color: Colors.black45),
                                ),
                                SizedBox(height: 12),
                                GestureDetector(
                                  onTap: () {
                                    // Share.share("com.example.maya_pay");
                                    shareButton();
                                  },
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 23,
                                      backgroundColor: Colors.green.shade100,
                                      child: Icon(
                                        Icons.share,
                                        color: Colors.green,
                                        size: 25,
                                      ),
                                    ),
                                    title: Text(
                                      "Invite Friends to MayaPay",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      // info section
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              offset: Offset(4.0, 4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            )
                          ],
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21),
                          ),
                          elevation: 0,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, top: 12, bottom: 8),
                                child: Text(
                                  "Info",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(.5),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    openUrl("https://sadapay.pk/privacy/");
                                  },
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 23,
                                      backgroundColor: Colors.green.shade100,
                                      child: Icon(
                                        Icons.privacy_tip,
                                        color: Colors.green,
                                        size: 25,
                                      ),
                                    ),
                                    title: Text(
                                      infoList[0],
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  openUrl("https://sadapay.pk/terms/");
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 23,
                                      backgroundColor: Colors.green.shade100,
                                      child: Icon(
                                        Icons.contact_page_sharp,
                                        color: Colors.green,
                                        size: 25,
                                      ),
                                    ),
                                    title: Text(
                                      infoList[1],
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // final url = "https://sadapay.pk/terms/";

                                  // if (await canLaunchUrl(Uri.parse(url))) {
                                  //   await launchUrl(Uri.parse(url));
                                  // }

                                  openUrl("https://sadapay.pk/soc/");
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 23,
                                      backgroundColor: Colors.green.shade100,
                                      child: Icon(
                                        Icons.calendar_today_outlined,
                                        color: Colors.green,
                                        size: 25,
                                      ),
                                    ),
                                    title: Text(
                                      infoList[2],
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      //Sign Out Button
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              offset: Offset(4.0, 4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            )
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            await FirebasePhoneAuthHandler.signOut(context);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Logged out successfully!')));
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              AuthenticationScreen.id,
                              (route) => false,
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21),
                            ),
                            elevation: 0,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 23,
                                  backgroundColor: Colors.green.shade100,
                                  child: Icon(
                                    Icons.login_outlined,
                                    color: Colors.green,
                                    size: 25,
                                  ),
                                ),
                                title: Text(
                                  "SignOut",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DisCoverCards extends StatelessWidget {
  const DisCoverCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                height: 220,
                width: 150,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 160,
                        width: 130,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: Offset(4.0, 4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(25),
                          color: whiteColor,
                          // gradient: LinearGradient(
                          //   colors: [
                          //     Color(0xff6f5f90),
                          //     Color(0xff758eb7),
                          //   ],
                          // ),
                        ),
                      ),
                    ),
                    Image.asset("assets/images/baloons.png"),
                    Positioned(
                      bottom: 50,
                      left: 19,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Welcome! to ",
                              textAlign: TextAlign.center,
                              style: acountName5Heading,
                            ),
                            Text(
                              "MayaPay",
                              textAlign: TextAlign.center,
                              style: acountName5Heading,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                height: 220,
                width: 150,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 160,
                        width: 130,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: Offset(4.0, 4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(25),
                          color: whiteColor,
                          // gradient: LinearGradient(
                          //   colors: [
                          //     Color(0xff6f5f90),
                          //     Color(0xff758eb7),
                          //   ],
                          // ),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/coins2.png"),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: 100,
                    //   height: 100,
                    //   child: Positioned(
                    //     // left: 10,
                    //     top: 0,
                    //     right: 0,
                    //     child:
                    //         Image.asset("assets/images/coins2.png"),
                    //   ),
                    // ),
                    Positioned(
                      bottom: 50,
                      left: 14,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Load Money to",
                              textAlign: TextAlign.center,
                              style: acountName5Heading,
                            ),
                            Text(
                              "Your account",
                              textAlign: TextAlign.center,
                              style: acountName5Heading,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                height: 220,
                width: 150,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 160,
                        width: 130,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: Offset(4.0, 4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(25),
                          color: whiteColor,
                          // gradient: LinearGradient(
                          //   colors: [
                          //     Color(0xff6f5f90),
                          //     Color(0xff758eb7),
                          //   ],
                          // ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 19,
                      child: Container(
                        height: 120,
                        child: Image.asset("assets/images/debitCard.png"),
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      left: 19,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Order your ",
                              textAlign: TextAlign.center,
                              style: acountName5Heading,
                            ),
                            Text(
                              "Physical Card",
                              textAlign: TextAlign.center,
                              style: acountName5Heading,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                height: 220,
                width: 150,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 160,
                        width: 130,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: Offset(4.0, 4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(25),
                          color: whiteColor,
                          // gradient: LinearGradient(
                          //   colors: [
                          //     Color(0xff6f5f90),
                          //     Color(0xff758eb7),
                          //   ],
                          // ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 19,
                      child: Container(
                        height: 120,
                        child: Image.asset("assets/images/lock2.png"),
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      left: 23,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Secure your ",
                              textAlign: TextAlign.center,
                              style: acountName5Heading,
                            ),
                            Text(
                              "Account!",
                              textAlign: TextAlign.center,
                              style: acountName5Heading,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
