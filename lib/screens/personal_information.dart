import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maya_pay/screens/home_screen.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({Key? key}) : super(key: key);

  @override
  _PersonalInformationScreenState createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  TextEditingController cnicnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> firebaseRef() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    if (_formKey.currentState!.validate()) {
      // Get the values from the text fields
      final name = cnicnameController.text;
      final email = emailController.text;

      // Store the data in Firestore
      await FirebaseFirestore.instance.collection('users').add({
        'name': name,
        'email': email,
      }).then((value) {
        // Data saved successfully
        Navigator.pushNamedAndRemoveUntil(
            context, HomeScreen.id, (route) => false);
        return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Data saved Successfully"),
          ),
        );
      }).catchError((error) {
        // Handle any errors
        print('Error: $error');
      });
    }
  }

  void _showModalBottomSheet(BuildContext context, String name) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(21),
              topRight: Radius.circular(21),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Hide Bar
                Container(
                  width: 40,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.5),
                    borderRadius: BorderRadius.circular(21),
                  ),
                ),
                // Text Column...
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      cnicnameController.text.toString(),
                      style: TextStyle(
                        color: Colors.black.withOpacity(.8),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Yout identity details will be verified against this name. Please ensure there are no spelling mistakes",
                      style: TextStyle(
                        color: Colors.black.withOpacity(.3),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                // Buttons Column
                Column(
                  children: [
                    // Edit Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Edit",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.edit_outlined,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Continue Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        firebaseRef();
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 15),
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
                  ],
                ),
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Personal Information",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 33,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Following information helps us create your account",
                      style: TextStyle(
                        color: Colors.black.withOpacity(.5),
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 60),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            "Name (as it appears on your CNIC)",
                            style: TextStyle(
                              color: Colors.black.withOpacity(.5),
                              fontSize: 17,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: cnicnameController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(16),
                            fillColor: Colors.black,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(.3),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(
                                color: Colors.lightBlue.withOpacity(.5),
                              ),
                            ),
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please enter your Name!";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            "Email",
                            style: TextStyle(
                              color: Colors.black.withOpacity(.5),
                              fontSize: 17,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.black),
                          controller: emailController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(16),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(.3),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(
                                color: Colors.lightBlue.withOpacity(.5),
                              ),
                            ),
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please enter your Email!";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
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
            _showModalBottomSheet(context, cnicnameController.text.toString());
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
