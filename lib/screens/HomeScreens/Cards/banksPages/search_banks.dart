import 'package:flutter/material.dart';
import 'package:maya_pay/screens/HomeScreens/Cards/banksPages/Send%20Money/account_number.dart';

class SearchBanks extends StatefulWidget {
  SearchBanks({Key? key}) : super(key: key);

  @override
  State<SearchBanks> createState() => _SearchBanksState();
}

class _SearchBanksState extends State<SearchBanks> {
  final searchController = TextEditingController();

  List<String> Allbanks = [
    "SadaPay",
    "NayaPay",
    "Allied Bank Limited",
    "Askari Bank Limited",
    "Bank Alfalah Limited",
    "Bank AL Habib Limited",
    "Bank of Khyber",
    "Bank of Punjab",
    "Dubai Islamic Bank Pakistan Limited",
    "Faysal Bank Limited",
    "First Women Bank Limited",
    "Habib Bank Limited",
    "Habib Metropolitan Bank Limited",
    "JS Bank Limited",
    "MCB Bank Limited",
    "Meezan Bank Limited",
    "EasyPaisa",
    "MCB Islamic Bank Limited",
    "JazzCash",
    "National Bank of Pakistan",
    "NRSP Microfinance Bank Limited",
    "Silkbank Limited",
    "Sindh Bank Limited",
    "Soneri Bank Limited",
    "Summit Bank Limited",
    "The Bank of Khyber",
    "The Bank of Punjab",
    "United Bank Limited",
  ];

  List<String> _bankIcons = [
    "assets/bankIcons/sadapay.png",
    "assets/bankIcons/nayapay.png",
    "assets/bankIcons/alliedBank.png",
    "assets/bankIcons/askariBank.png",
    "assets/bankIcons/alfalah.jpg",
    "assets/bankIcons/hmb.jpg",
    "assets/bankIcons/khyberbank.jpg",
    "assets/bankIcons/bop.jpg",
    "assets/bankIcons/dubaibank.jpg",
    "assets/bankIcons/faysalbank.jpg",
    "assets/bankIcons/womenbank.jpg",
    "assets/bankIcons/hbl.jpg",
    "assets/bankIcons/hmb.jpg",
    "assets/bankIcons/jsbank.jpg",
    "assets/bankIcons/mcb.jpg",
    "assets/bankIcons/sadapay.png",
    "assets/bankIcons/easypaisa.jpg",
    "assets/bankIcons/mcb.jpg",
    "assets/bankIcons/jazzcash.jpg",
    "assets/bankIcons/mcb.jpg",
    "assets/bankIcons/nrsp.jpg",
    "assets/bankIcons/silkbank.jpg",
    "assets/bankIcons/sindh.jpg",
    "assets/bankIcons/soneri.jpg",
    "assets/bankIcons/summit.jpg",
    "assets/bankIcons/khyberbank.jpg",
    "assets/bankIcons/bop.jpg",
    "assets/bankIcons/ubl.jpg",
  ];

  List filteredBanks = [];

  @override
  void initState() {
    filteredBanks = Allbanks;
    super.initState();
  }

  void searchBanks(String query) {
    filteredBanks = Allbanks.where((bank) {
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
                "Choose Constitution",
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
                      onChanged: searchBanks,
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
                      itemCount: filteredBanks.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return AccountNumberScreen(
                                    name: Allbanks[index],
                                  );
                                },
                              ),
                            );
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: AssetImage(_bankIcons[index]),
                            ),
                            title: Text(
                              filteredBanks[index],
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
