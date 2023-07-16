import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maya_pay/utils/fonts.dart';

class TopUpAmount extends StatelessWidget {
  final String? phoneNumber;
  final String? operatorName;
  TopUpAmount({super.key, this.phoneNumber, this.operatorName});

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        toolbarHeight: 80,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Mobile Top Up",
          style: acountNameHeading,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: blackColor,
            )),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Top Up amount",
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.phone,
              style: TextStyle(color: blackColor),
              controller: amountController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: lightblueColor,
                  ),
                ),
                focusColor: lightblueColor,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: lightblueColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21),
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),
              child: Center(
                child: ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      border: Border.all(
                        color: greyColor,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.settings_input_antenna_rounded,
                        color: lightblueColor,
                      ),
                    ),
                  ),
                  title: Text(
                    "${phoneNumber.toString()}",
                    style: acountNameHeading,
                  ),
                  subtitle: Text(
                    "${operatorName}",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  trailing: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: lightblueColor,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "Edit",
                      style: TextStyle(
                        color: lightblueColor,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
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
          onPressed: () {},
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
