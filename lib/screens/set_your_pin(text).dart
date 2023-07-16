import 'package:flutter/material.dart';
import 'package:maya_pay/screens/Login/login_pin.dart';

class SetYourPinTextOnly extends StatefulWidget {
  const SetYourPinTextOnly({super.key});

  @override
  State<SetYourPinTextOnly> createState() => _SetYourPinTextOnlyState();
}

class _SetYourPinTextOnlyState extends State<SetYourPinTextOnly> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 12.0, right: 12, top: 40, bottom: 20),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                        )
                      ],
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/lockblue.jpg"))),
                ),
                SizedBox(height: 20),
                Text(
                  "Great Let's set your",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "MayaPay PIN",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "This wil be Your 5-digit code that you will use to log in to your MayaPay",
                  style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
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
              )),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return LoginPinScreen();
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
