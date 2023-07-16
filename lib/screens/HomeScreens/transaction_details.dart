import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maya_pay/utils/fonts.dart';

class TransactionDetails extends StatelessWidget {
  final String accountName;
  var amounts;
  final String icon;
  TransactionDetails({
    super.key,
    required this.accountName,
    required this.amounts,
    required this.icon,
  });

  final timeOfTransaction = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.lightBlue.shade700,
        elevation: 0,
        title: Text(
          "Money sent",
          style: TextStyle(color: whiteColor),
        ),
        centerTitle: true,
        toolbarHeight: 80,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: whiteColor,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 350,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Colors.lightBlue.shade700,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Image.asset(icon),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Rs. ${amounts}",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: whiteColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "From ${accountName}",
                      style: TextStyle(fontSize: 18, color: whiteColor),
                    ),
                    Text(
                      "To Muhammad Atif Raza",
                      style: TextStyle(fontSize: 18, color: whiteColor),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "${timeOfTransaction.hour}:${timeOfTransaction.minute}",
                      style: TextStyle(
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
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
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "From",
                          style: TextStyle(
                            color: greyColor,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "SadaPay",
                          style: details2Text,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "1234567890",
                          style: details2Text,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "To",
                          style: TextStyle(
                            color: greyColor,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Easypaisa",
                          style: details2Text,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "1234567890",
                          style: details2Text,
                        ),
                        SizedBox(height: 18),
                        Divider(
                          height: 2,
                          color: greyColor,
                        ),
                        SizedBox(height: 18),
                        Text(
                          "Reference No.",
                          style: TextStyle(
                            color: greyColor,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "800325",
                          style: details2Text,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
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
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Service Fee + Tax",
                          style: TextStyle(
                            color: greyColor,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Rs. 0  🎉",
                          style: TextStyle(
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
