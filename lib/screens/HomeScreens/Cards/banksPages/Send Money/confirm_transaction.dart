import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maya_pay/screens/DataNavigation/data_navigation.dart';
import 'package:maya_pay/screens/HomeScreens/Cards/banksPages/Send%20Money/money_sent_successfully.dart';
import 'package:maya_pay/screens/home_screen.dart';
import 'package:maya_pay/utils/fonts.dart';

class ConfirmTransaction extends StatelessWidget {
  final String? accountNumber;
  final String? accountImage;
  final String? amount;
  ConfirmTransaction({
    super.key,
    this.accountImage,
    this.accountNumber,
    this.amount,
  });

  TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        title: Text(
          "Confirm",
          style: TextStyle(
            color: Colors.black,
            fontSize: 21,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade100,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (context) {
                  return HomeScreen();
                },
              ), (route) => false);
            },
            icon: Icon(
              Icons.cancel_sharp,
              color: blackColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            child: Column(
              children: [
                Container(
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
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(""),
                          ),
                          title: Text(
                            "Muhammad Atif Raza",
                            style: acountNameHeading,
                          ),
                          subtitle: Text(
                            "${accountNumber.toString()}",
                            style: details3Text,
                          ),
                          trailing: Icon(
                            Icons.edit,
                            color: greyColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
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
                            "Recipient will get",
                            style: TextStyle(
                              color: greyColor,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text("Rs. 20", style: acountNameHeading),
                          // GetBuilder<DataController>(
                          //   builder: (controller) {
                          //     return Text(
                          //       "Rs. ${dataController.value}",
                          //       style: acountNameHeading,
                          //     );
                          //   },
                          // ),
                          SizedBox(height: 20),
                          Divider(
                            height: 2,
                            color: greyColor,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Sender fee",
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
                          SizedBox(height: 20),
                          Divider(
                            height: 2,
                            color: greyColor,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Add a note",
                            style: TextStyle(
                              color: greyColor,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: noteController,
                            style: TextStyle(
                              color: blackColor,
                            ),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                color: greyColor,
                              ),
                              hintText: "e.g. today's lunch 🍕",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(26),
                                borderSide: BorderSide(
                                  color: greyColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(26),
                                borderSide: BorderSide(
                                  color: greyColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(26),
                                borderSide: BorderSide(
                                  color: greyColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(
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
            Get.to(SentMoneySuccessfully());
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Send Money",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.check,
                  color: whiteColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
