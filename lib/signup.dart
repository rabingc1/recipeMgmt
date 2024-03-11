import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:recipemgmt/signin.dart';
import 'package:recipemgmt/utils/utils.dart';


class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);
  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

FirebaseAuth _auth = FirebaseAuth.instance;
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  //A function that validate user entered password
  bool validatePassword(String pass) {
    String _password = pass.trim();
    if (pass_valid.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New ID Registration"),
      ),
      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/backgroundimg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: 350,
            height: 670,
            color: Colors.white38,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 30,
                    ),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                        "images/foodlogo.png",
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    Container(
                      height: 5,
                    ),
                    Container(
                      child: Text(
                        "Food Nepal",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: Text(
                        "New Registration",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(12.0),


                          child: TextFormField(
                            controller: nameController,
                            decoration: const InputDecoration(
                                focusColor: Colors.orangeAccent,
                                border: OutlineInputBorder(),
                                labelText: 'Enter Name',
                                prefixIcon:
                                Icon(Icons.drive_file_rename_outline)),
                            validator: (value){
                              if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                                //allow upper and lower case alphabets and space
                                return "Enter Correct Name";
                              }else{
                                return null;
                              }
                            },
                          ),



                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            controller: numberController,
                            decoration: const InputDecoration(
                                focusColor: Colors.orangeAccent,
                                border: OutlineInputBorder(),

                                labelText: 'Enter Phone Number',
                                prefixIcon: Icon(Icons.phone)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please enter phone number";
                              }
                              return null;
                            },

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                                focusColor: Colors.orangeAccent,
                                border: OutlineInputBorder(),
                                labelText: 'Enter Email',
                                prefixIcon: Icon(Icons.email)),
                            validator: (value){
                              if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
                                return "Enter Correct Email Address";
                              }else{
                                return null;
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                focusColor: Colors.orangeAccent,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.greenAccent),
                                ),
                                labelText: 'Enter New Password',
                                prefixIcon: Icon(Icons.lock),
                                suffix: Icon(Icons.visibility),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter password";
                                } else {
                                  //call function to check password
                                  bool result = validatePassword(value);
                                  if (result) {
                                    // create account event
                                    return null;
                                  } else {
                                    return " Password should contain Capital, small letter, Number & Special";
                                  }
                                }
                              }
                          ),
                        ),
                        /* Padding(
                          padding: const EdgeInsets.all(15.0 ),
                          child: TextField(
                              obscureText: true,
                              decoration: const InputDecoration(

                                  focusColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2,color: Colors.greenAccent),
                                  ),
                                  labelText: 'Enter New Password',
                                  prefixIcon: Icon(Icons.lock),
                                  suffix: Icon(Icons.visibility)


                              )
                          ),
                        ),*/
                        ElevatedButton(
                            child: Text('SIGN UP'),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _auth.createUserWithEmailAndPassword(
                                    email: emailController.text.toString(),
                                    password: passwordController.text.toString()).then((value){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => signin()));
                                }).onError((error, stackTrace){
                                  Utils().toastMessage(error.toString());
                                });

                                // [Get user and pass it to controller
                            /*
                                final user = UserModel(
                                    email: controller.email.text.trim(),
                                    password: controller.password.text.trim(),
                                    name: controller.name.text.trim(),
                                    phoneno: controller.phoneno.text.trim(),
                              );
                                SignUpController.instance.emailAuthintication(user.email);
                                Get.to(()=> signin() );*/

                              }
                            },
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(
                                context,
                                MaterialPageRoute(builder: (Context) => signin()),
                              );
                            },
                            child: Text(
                              "GO TO LOG IN PAGE",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            )
                        )

                      ],
                    ),
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

class Utils { void toastMessage(String message){
  Fluttertoast.showToast(
      msg: "message",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
}
