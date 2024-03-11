import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipemgmt/forgot_password.dart';
import 'package:recipemgmt/homepage.dart';
import 'package:recipemgmt/signup.dart';
import 'package:flutter/services.dart';




import 'main.dart';

class signin extends StatefulWidget {
   const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => signinState();
}

class signinState extends State<signin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;




  Future<void> _login()  async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      // Login successful, handle navigation to other screens here
      if (userCredential.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage()
          ),
        );
      }
    } catch (e) {
      // Login failed, handle error (display an error message, etc.)
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Login Failed"),
            content: const Text(
              "Invalid email or password. Please try again.",
              style: TextStyle(color: Colors.red),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=> _onBackButtonPressed(context),
      child: Scaffold(

          body:
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/backgroundimg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: 590,
                        color: Colors.white54,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 40,
                            ),
                            const CircleAvatar(
                              radius: 50,
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
                                "FOOD NEPAL",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              child: const Text(
                                "LOG IN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Form(
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: TextFormField(
                                      controller: _emailController,
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
                                          return "Enter Correct Email";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: TextFormField(
                                      controller: _passwordController,
                                      obscureText: _obscureText,

                                      decoration:  InputDecoration(
                                        focusColor: Colors.orangeAccent,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Colors.greenAccent),
                                        ),
                                        labelText: 'Enter Password',
                                        prefixIcon: Icon(Icons.lock),
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _obscureText = !_obscureText;
                                            });
                                          },
                                          child: Icon(
                                            _obscureText ? Icons.visibility : Icons.visibility_off,
                                          ),
                                        ),

                                      ),
                                    ),
                                  ),

                                  ElevatedButton(
                                      onPressed: _login, child: Text("log in ")),

                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                               forgot_password()),
                                        );
                                      },
                                      child: Text(
                                        "Forgot Password",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            decoration: TextDecoration.underline),
                                      )), //FORGOT PASSWORD BUTTON
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const signup()),
                                        );
                                      },
                                      child: Text(
                                        "New Registration",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            decoration: TextDecoration.underline),
                                      )), // SIGNUP BUTTON
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "SKIP WITHOUT LOG IN  ",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }

 Future<bool> _onBackButtonPressed(BuildContext context) async{
   bool exitApp = await showDialog(context: context, builder: (BuildContext context){
     return AlertDialog(
       title: Text("Really"),
       content: Text("Do you want to exit app?"),
       actions: <Widget>[
         TextButton(onPressed: ()
         {
           Navigator.of(context).pop(false);
         },
             child: Text("No")
         ),
         TextButton(onPressed: ()
         {
           Navigator.of(context).pop(true);
         },
             child: Text("Yes")
         )
       ],
     );
   }
   );
   return exitApp ?? false;
 }


}
