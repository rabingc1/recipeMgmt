import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class forgot_password extends StatefulWidget {
 const forgot_password({super.key});

  @override
  State<forgot_password> createState() => _forgot_passwordState();
}

class _forgot_passwordState extends State<forgot_password> {
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isResetSent = false;

  Future<void> _resetPassword() async {
    final String email = _emailController.text.trim();
    try {
      await _auth.sendPasswordResetEmail(email: email);
      setState(() {
        _isResetSent = true;
      });
      _showResetSuccessDialog();
    } catch (e) {
      print('Error sending password reset email: $e');
      _showErrorDialog(e.toString());
      // Handle any errors that occur while sending the reset email.
    }
  }
  void _showResetSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Password Reset Success'),
          content: Text('A password reset link has been sent to your email.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Uff !! Sorry'),
          content: Text("There is no user record found in our Database!!"
              "   Please Registered new user"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Forgot Password"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(

                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 50,
                      ),
                      const CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(
                          "images/foodlogo.png",
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      Container(
                        height: 25,
                      ),
                      Container(
                        child: const Text(
                          "Enter Registered Email Address",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                             ),
                        ),
                      ),
                      Container(
                        height: 25,
                      ),
                      Form(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    focusColor: Colors.orangeAccent,
                                    border: OutlineInputBorder(),
                                    labelText: 'Enter Email',
                                    prefixIcon: Icon(Icons.email)),
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[a-z A-Z]+$')
                                          .hasMatch(value)) {
                                    //allow upper and lower case alphabets and space
                                    return "Enter Correct Name";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),


                            ElevatedButton(
                                onPressed: _isResetSent ? null : _resetPassword ,child: Text("Reset-Password ")),



                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ));
  }
}
