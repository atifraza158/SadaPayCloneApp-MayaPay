import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maya_pay/screens/HomeScreens/transaction_details.dart';
import 'package:maya_pay/utils/fonts.dart';

class TranactionHistory extends StatefulWidget {
  TranactionHistory({super.key});

  @override
  State<TranactionHistory> createState() => _TranactionHistoryState();
}

class _TranactionHistoryState extends State<TranactionHistory> {
  List<String> transactionNames = [
    "Atif Raza",
    "Ahmar Ali",
    "Muneeb ur Rehman",
    "Najam-ul-hassan",
    "Haseeb Rafiq",
    "Faheem Arshad",
    "Usama Razaq Wahla",
    "Masab Zafar",
    "Hammad Cheif",
    "Ahmad Shoukat",
    "Rehan Nadeem",
    "Sabtain",
    "Ahsan Raza",
    "Mohsin Naveed",
  ];

  List<String> icons = [
    "assets/images/ms.png",
    "assets/images/ms.png",
    "assets/images/mr.png",
    "assets/images/tc.png",
    "assets/images/mr.png",
    "assets/images/ms.png",
    "assets/images/ms.png",
    "assets/images/mr.png",
    "assets/images/tc.png",
    "assets/images/ms.png",
    "assets/images/mr.png",
    "assets/images/mr.png",
    "assets/images/tc.png",
    "assets/images/tc.png",
  ];

  final timeOfTransaction = DateTime.now();

  List ammountList = [
    72,
    120,
    5000,
    200,
    130,
    5,
    130,
    130,
    130,
    130,
    130,
    130,
    130,
    130,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        title: Text(
          "Transaction history",
          style: appBarText,
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Today",
                style: TextStyle(
                  fontSize: 28,
                  letterSpacing: 2,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: transactionNames.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ListTile(
                        onTap: () {
                          Get.to(TransactionDetails(
                            accountName: transactionNames[index],
                            amounts: ammountList[index],
                            icon: icons[index],
                          ));
                        },
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.1),
                              borderRadius: BorderRadius.circular(16)),
                          child: Image.asset(icons[index]),
                        ),
                        title: Text(
                          "${transactionNames[index]}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "${timeOfTransaction.hour}:${timeOfTransaction.minute}",
                          style: TextStyle(color: greyColor),
                        ),
                        trailing: Text(
                          "Rs ${ammountList[index]}",
                          style: TextStyle(
                            color: greyColor,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
