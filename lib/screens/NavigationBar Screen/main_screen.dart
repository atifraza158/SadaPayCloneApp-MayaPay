import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:maya_pay/screens/HomeScreens/atmcard_screen.dart';
// import 'package:maya_pay/screens/HomeScreens/discover_section.dart';
import 'package:maya_pay/screens/HomeScreens/load_money.dart';
import 'package:maya_pay/screens/HomeScreens/sendAndRequestScreen.dart';
import 'package:maya_pay/screens/HomeScreens/transaction_details.dart';
import 'package:maya_pay/screens/HomeScreens/transaction_history.dart';
import 'package:maya_pay/utils/fonts.dart';

double balance = 20;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String transactionName = "Atif Raza";
  DateTime timeOfTransaction = DateTime.now();
  double ammount = 20;

  // Future<void> _handleRefresh() async {
  //   return await Future.delayed(Duration(seconds: 2));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return AtmCardScreen();
                          },
                        ));
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .5,
                            height: MediaQuery.of(context).size.height * .35,
                            decoration: BoxDecoration(
                              // color: Colors.lightBlue,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.lightBlue.shade700,
                                  Colors.lightBlue,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(21),
                            ),
                          ),
                          Positioned(
                            top: 14,
                            left: 16,
                            child: Text(
                              "Current Balance",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0, top: 35),
                            child: Text(
                              "Rs. $balance",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 20,
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.asset(
                                "assets/images/debitcardicon.png",
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            right: 20,
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Column(
                        children: [
                          // Load Money Button
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return LoadMoneyScreen();
                                },
                              ));
                            },
                            child: Stack(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * .4,
                                  height:
                                      MediaQuery.of(context).size.height * .17,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xff6f5f90),
                                        Color(0xff758eb7),

                                        // Color(0xff138086),
                                        // Color(0xff534666),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(21),
                                  ),
                                ),
                                // Arrow Icon
                                Positioned(
                                  top: 20,
                                  left: 20,
                                  child: Icon(
                                    Icons.arrow_downward,
                                    color: Colors.white,
                                  ),
                                ),
                                // Load Money Text
                                Positioned(
                                  bottom: 12,
                                  left: 12,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Load",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          )),
                                      Text("Money",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          // Send & Request Money Button
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return SendMoney();
                                },
                              ));
                            },
                            child: Stack(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * .4,
                                  height:
                                      MediaQuery.of(context).size.height * .17,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        // Color(0xff138086),
                                        // Color(0xff534666),

                                        Color(0xff6f5f90),
                                        Color(0xff758eb7),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(21),
                                  ),
                                ),
                                Positioned(
                                  top: 20,
                                  right: 20,
                                  child: Icon(
                                    Icons.arrow_outward_sharp,
                                    color: Colors.white,
                                  ),
                                ),
                                Positioned(
                                  bottom: 14,
                                  left: 14,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Send &",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          )),
                                      Text(
                                        "Request",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
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
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Transactions",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: lightblueColor,
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return TranactionHistory();
                                    },
                                  ));
                                },
                                child: Text(
                                  "See all",
                                  style: TextStyle(
                                    color: Colors.lightBlue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: ListTile(
                            onTap: () {
                              Get.to(TransactionDetails(
                                accountName: transactionName,
                                amounts: ammount,
                                icon: "assets/images/ms.png",
                              ));
                            },
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Image.asset("assets/images/ms.png"),
                            ),
                            title: Text(
                              "$transactionName",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "$timeOfTransaction",
                              style: TextStyle(color: Colors.black),
                            ),
                            trailing: Text(
                              "$ammount",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(height: 20),
                // Row(
                //   children: [
                //     DiscoverCards(),
                //   ],
                // ),
                SizedBox(height: 50),
                Expanded(
                  child: ListView(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                    image:
                                        AssetImage("assets/images/coins2.png"),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                  child: Image.asset(
                                      "assets/images/debitCard.png"),
                                ),
                              ),
                              Positioned(
                                bottom: 50,
                                left: 19,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class MyCards extends StatelessWidget {
//   const MyCards({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       child: SizedBox(
//         height: 220,
//         width: 150,
//         child: Stack(
//           children: [
//             Positioned(
//               bottom: 10,
//               left: 0,
//               right: 0,
//               child: Container(
//                 height: 160,
//                 width: 130,
//                 decoration: BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.shade300,
//                       offset: Offset(4.0, 4.0),
//                       blurRadius: 15.0,
//                       spreadRadius: 1.0,
//                     )
//                   ],
//                   borderRadius: BorderRadius.circular(25),
//                   color: whiteColor,
//                   // gradient: LinearGradient(
//                   //   colors: [
//                   //     Color(0xff6f5f90),
//                   //     Color(0xff758eb7),
//                   //   ],
//                   // ),
//                 ),
//               ),
//             ),
//             Image.asset("assets/images/baloons.png"),
//             Positioned(
//               bottom: 50,
//               left: 16,
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Welcome! to ",
//                       textAlign: TextAlign.center,
//                       style: acountNameHeading,
//                     ),
//                     Text(
//                       "MayaPay",
//                       textAlign: TextAlign.center,
//                       style: acountNameHeading,
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
