import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maya_pay/screens/Payments/NewMobileTopUp/top_up_amount.dart';
import 'package:maya_pay/utils/fonts.dart';

class NewMobileTopUps extends StatefulWidget {
  NewMobileTopUps({super.key});

  @override
  State<NewMobileTopUps> createState() => _NewMobileTopUpsState();
}

class _NewMobileTopUpsState extends State<NewMobileTopUps> {
  TextEditingController phoneController = TextEditingController();
  String SelectedOparator = "";

  List<String> operatorsText = [
    "Zong PrePaid",
    "Jazz PrePaid",
    "Ufone PrePaid",
  ];

  List<String> operators = [
    "assets/operators/zong.png",
    "assets/operators/jazzLogo.png",
    "assets/operators/ufone.png",
  ];

  bool isSelected = false;
  bool isLoading = false;

  void _showModalBottomSheet(BuildContext context, String text) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          height: 350,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "Choose Operator",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ListView.builder(
                    itemCount: operatorsText.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(21),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                )),
                            child: Center(
                              child: Expanded(
                                child: ListTile(
                                  onTap: () {
                                    setState(() {
                                      SelectedOparator = operatorsText[index];
                                    });
                                    Get.back();
                                  },
                                  leading: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(150),
                                      border: Border.all(
                                        color: greyColor,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: AssetImage(
                                        operators[index],
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    "${operatorsText[index]}",
                                    style: acountNameHeading,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

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
              "Mobile Number",
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.phone,
              style: TextStyle(color: blackColor),
              controller: phoneController,
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
                  )),
              child: Center(
                child: ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150),
                        border: Border.all(
                          color: greyColor,
                        )),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.settings_input_antenna_rounded,
                        color: lightblueColor,
                      ),
                    ),
                  ),
                  title: Text(
                    SelectedOparator.isEmpty
                        ? "Select Operator"
                        : SelectedOparator,
                    style: acountNameHeading,
                  ),
                  trailing: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: lightblueColor,
                    ),
                    onPressed: () {
                      _showModalBottomSheet(context, "");
                    },
                    child: Text(
                      "Select",
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
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return TopUpAmount(
                  operatorName: SelectedOparator,
                  phoneNumber: phoneController.text.toString(),
                );
              },
            ));
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
