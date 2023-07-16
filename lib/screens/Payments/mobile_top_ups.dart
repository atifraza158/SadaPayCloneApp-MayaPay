import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maya_pay/screens/Payments/NewMobileTopUp/new_mobile_top_up.dart';
import 'package:maya_pay/utils/fonts.dart';

class MobileTopUps extends StatefulWidget {
  const MobileTopUps({super.key});

  @override
  State<MobileTopUps> createState() => _MobileTopUpsState();
}

class _MobileTopUpsState extends State<MobileTopUps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 120,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.white,
                ),
                titlePadding: EdgeInsetsDirectional.only(
                  start: 16,
                  bottom: 16,
                ),
                title: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Mobile Top-Ups",
                    style: TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Colors.black,
                  )),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 450,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                        child: InkWell(
                          onTap: () {
                            Get.to(NewMobileTopUps());
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
                                  backgroundColor:
                                      Colors.green.shade100.withOpacity(.4),
                                  child: Center(
                                    child: SizedBox(
                                      width: 30,
                                      height: 30,
                                      child:
                                          Image.asset("assets/icons/bank2.png"),
                                    ),
                                  ),
                                ),
                                title: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 13),
                                  child: Text(
                                    "New Mobile Top-ups",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    "Top-up any prepaid mobile network operator",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(.5)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 80,
                            child: Image.asset("assets/images/search.png"),
                          ),
                          Text(
                            "No recent top ups",
                            style: acountNameHeading,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Top up a new number to view it here",
                            style: details4Text,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
