import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maya_pay/screens/Payments/Bills/consumer_number.dart';

class ChooseBillerScreen extends StatefulWidget {
  const ChooseBillerScreen({super.key});

  @override
  State<ChooseBillerScreen> createState() => _ChooseBillerScreenState();
}

class _ChooseBillerScreenState extends State<ChooseBillerScreen> {
  final searchController = TextEditingController();

  List<String> Allbanks = [
    "24Hour.PK Pvt Ltd.",
    "42 Days Challenge",
    "5i Creations",
    "AA JoyLand",
    "AA Logics",
    "ABL Aggregator",
    "ABL Asset Managment Company",
    "AEO Pakistan",
    "AEO Pakistan (islamabad)",
    "AEO Pakistan (KPK)",
    "AEO Pakistan (Punjab)",
    "AEO Pakistan (Sindh)",
    "AEO Pakistan Education",
    "Al Kabir Town Private Limited",
    "AMTF - Donation",
    "AMTF - Zakat",
    "APS College",
    "ARY Jewellers",
    "ARY Services",
    "AaBaCaDa School",
    "Abasyn University",
    "Accountansea",
    "Advance Fitness(Bilal Brothers)",
    "Advance laboratories",
  ];

  List filteredBills = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filteredBills = Allbanks;
  }

  void searchBiller(String query) {
    filteredBills = Allbanks.where((bank) {
      return bank.toLowerCase().contains(query.toLowerCase());
    }).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 120,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsetsDirectional.only(
                start: 16,
                bottom: 16,
              ),
              title: Text(
                "Choose Biller",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      controller: searchController,
                      onChanged: searchBiller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 25,
                        ),
                        contentPadding: EdgeInsets.all(18),
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(.3),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide(
                            color: Colors.lightBlue,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: filteredBills.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(ConsumerNumberScreen());
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.black,
                            ),
                            title: Text(
                              filteredBills[index],
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
