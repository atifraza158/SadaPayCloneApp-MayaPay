import 'package:flutter/material.dart';
import 'package:maya_pay/utils/fonts.dart';

class LoginPin extends StatefulWidget {
  const LoginPin({super.key});

  @override
  State<LoginPin> createState() => _LoginPinState();
}

class _LoginPinState extends State<LoginPin> {
  final pinController = TextEditingController();
  final FocusNode _pinFocusNode = FocusNode();

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  String _pin = '';

  void _addPinDigit(String digit) {
    setState(() {
      if (_pin.length < 4) {
        _pin += digit;
        pinController.text = _pin;
      }
    });
  }

  void _removePinDigit() {
    setState(() {
      if (_pin.isNotEmpty) {
        _pin = _pin.substring(0, _pin.length - 1);
        pinController.text = _pin;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.lightBlue.shade700,
            Colors.lightBlue,

            // Color(0xff6f5f90),
            // Color(0xff758eb7),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30,
                              child: Image.asset("assets/images/logo.png"),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "MayaPay",
                              style: acountNamewhiteHeading,
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 300,
                          child: TextField(
                            controller: pinController,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.transparent,
                              )),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 12),
                              counterText: '',
                            ),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              PinButton(
                                title: "1",
                                onPress: () {},
                                textColor: Colors.white,
                                color: Colors.white.withOpacity(.2),
                              ),
                              PinButton(
                                title: "2",
                                onPress: () {},
                                textColor: Colors.white,
                                color: Colors.white.withOpacity(.2),
                              ),
                              PinButton(
                                title: "3",
                                onPress: () {},
                                textColor: Colors.white,
                                color: Colors.white.withOpacity(.2),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              PinButton(
                                title: "4",
                                onPress: () {},
                                textColor: Colors.white,
                                color: Colors.white.withOpacity(.2),
                              ),
                              PinButton(
                                title: "5",
                                onPress: () {},
                                textColor: Colors.white,
                                color: Colors.white.withOpacity(.2),
                              ),
                              PinButton(
                                title: "6",
                                onPress: () {},
                                textColor: Colors.white,
                                color: Colors.white.withOpacity(.2),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              PinButton(
                                title: "7",
                                onPress: () {},
                                textColor: Colors.white,
                                color: Colors.white.withOpacity(.2),
                              ),
                              PinButton(
                                title: "8",
                                onPress: () {},
                                textColor: Colors.white,
                                color: Colors.white.withOpacity(.2),
                              ),
                              PinButton(
                                title: "9",
                                onPress: () {},
                                textColor: Colors.white,
                                color: Colors.white.withOpacity(.2),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              MyIconButton(
                                icon: Icon(
                                  Icons.fingerprint,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                onPress: () {},
                              ),
                              PinButton(
                                title: "0",
                                onPress: () {},
                                textColor: Colors.white,
                                color: Colors.white.withOpacity(.2),
                              ),
                              MyIconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                onPress: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PinButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final Color? color;
  final Color? textColor;
  PinButton({
    super.key,
    required this.title,
    required this.onPress,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: GestureDetector(
          onTap: onPress,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                title.toString(),
                style: TextStyle(
                  color: textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPress;
  MyIconButton({
    super.key,
    required this.icon,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Container(
          height: 80,
          child: Center(
            child: IconButton(
              onPressed: onPress,
              icon: icon,
            ),
          ),
        ),
      ),
    );
  }
}
