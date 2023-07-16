import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VirtualCard extends StatefulWidget {
  const VirtualCard({super.key});

  @override
  State<VirtualCard> createState() => _VirtualCardState();
}

class _VirtualCardState extends State<VirtualCard> {
  String cardNo = "1234\n\n5678\n\n9012\n\n3456";

  void _copyCardNumber(String _text) {
    Clipboard.setData(ClipboardData(text: _text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Card No. copied to clipboard"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(21),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: Offset(4.0, 4.0),
            blurRadius: 15.0,
            spreadRadius: 1.0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Main Row to separate logo and Card Number
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // For Logo and Title
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(
                          "assets/images/logo.png",
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Virtual",
                        style: TextStyle(
                            color: Colors.grey.withOpacity(.7), fontSize: 16),
                      )
                    ],
                  ),
                  // Column For Card Number
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0, top: 20),
                    child: Column(
                      children: [
                        Text(
                          cardNo,
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                            letterSpacing: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(21),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black.withOpacity(.6),
                        maximumSize: Size(200, 50),
                        minimumSize: Size(90, 50),
                      ),
                      onPressed: () {
                        _copyCardNumber(cardNo);
                      },
                      child: Text(
                        "Copy",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(21),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black.withOpacity(.6),
                        maximumSize: Size(200, 50),
                        minimumSize: Size(90, 50),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Hide",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// RichText(
//                         text: TextSpan(
//                             children: [
//                               TextSpan(text: "1234\n"),
//                               TextSpan(text: "5678\n"),
//                               TextSpan(text: "9012\n"),
//                               TextSpan(text: "3456\n"),
//                             ],
//                             style: TextStyle(
//                               color: Colors.grey,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 21,
//                             )),
//                       ),
