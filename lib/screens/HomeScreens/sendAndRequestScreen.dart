import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maya_pay/screens/HomeScreens/Cards/banksPages/request_banks.dart';
import 'package:maya_pay/screens/HomeScreens/Cards/banksPages/sending_banks.dart';
import 'package:maya_pay/screens/NavigationBar%20Screen/main_screen.dart';
import 'package:maya_pay/widgets/num_pad.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({Key? key}) : super(key: key);

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  final TextEditingController _myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _myController.text = 'Rs. ';
  }

  void navigate() {
    if (_myController.text.isNotEmpty) {
      Get.to(SendingBanksScreen());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please Enter Money"),
        ),
      );
    }
  }

  void requestNevigate() {
    if (_myController.text.isNotEmpty) {
      Get.to(RequestBanksScreen());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please Enter Money"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.lightBlue.shade700,
            Colors.lightBlue,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.transparent,
              onPressed: () {},
            )
          ],
          elevation: 0,
          title: Center(
            child: Container(
              alignment: Alignment(0.0, -1.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Current Balance",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Rs. $balance",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 130),
              SizedBox(
                height: 70,
                child: Center(
                  child: TextFormField(
                    controller: _myController,
                    textAlign: TextAlign.center,
                    showCursor: false,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                    keyboardType: TextInputType.none,
                    decoration: const InputDecoration(border: InputBorder.none),
                    enabled: false,
                  ),
                ),
              ),
              NumPad(
                controller: _myController,
                delete: () {
                  if (_myController.text.length > 3) {
                    _myController.text = _myController.text.substring(
                      0,
                      _myController.text.length - 1,
                    );
                  }
                },
                onSubmit: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150, 70),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: requestNevigate,
                      child: const Text(
                        'Request',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150, 70),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: navigate,
                      child: const Text(
                        'Send',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
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
    );
  }
}
