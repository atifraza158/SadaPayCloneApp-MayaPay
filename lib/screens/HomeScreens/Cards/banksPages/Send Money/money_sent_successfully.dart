import 'package:flutter/material.dart';
import 'package:maya_pay/screens/home_screen.dart';
import 'package:maya_pay/utils/fonts.dart';
import 'package:share_plus/share_plus.dart';

class SentMoneySuccessfully extends StatelessWidget {
  const SentMoneySuccessfully({super.key});

  @override
  Widget build(BuildContext context) {
    void shareButton() {
      Share.share("com.example.maya_pay");
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.grey.shade100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
              child: Image.asset("assets/images/logo.png"),
            ),
            SizedBox(width: 6),
            Text(
              "MayaPay",
              style: TextStyle(
                color: blackColor,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.lightBlue,
            ),
            onPressed: shareButton,
            child: Text(
              "Share",
              style: TextStyle(
                color: lightblueColor,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
            child: SizedBox(
              height: 420,
              width: MediaQuery.sizeOf(context).width,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 25,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: 350,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            offset: Offset(4.0, 4.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0,
                          )
                        ],
                      ),
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 60),
                                  Text(
                                    "Rs. 20",
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text("Atif Raza To",
                                      style: acountNameHeading),
                                  Text("Muhammad Atif Raza",
                                      style: acountNameHeading),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Date & Time (PKT)",
                                    style: details4Text,
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "09 July 2023, 11:02 AM",
                                    style: details2Text,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Receiver's Account",
                                    style: details4Text,
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "1234567890",
                                    style: details2Text,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Reference No.",
                                    style: details4Text,
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "700123",
                                    style: details2Text,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightblueColor,
                    ),
                    child: Center(
                        child: Icon(
                      Icons.check,
                      color: whiteColor,
                      size: 60,
                    )),
                  )
                ],
              ),
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
            ),
          ),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, HomeScreen.id, (route) => false);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Close",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
