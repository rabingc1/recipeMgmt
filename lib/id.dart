import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class id extends StatefulWidget {
  @override
  _idState createState() => _idState();
}

class _idState extends State<id> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String email = "rabingc@gmail.com"; // Store the user's email
  String password = "Rabin@1"; // Store the user's password

  // Function to handle user login
  Future<void> login() async {
    try {
      // Sign in with email and password
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      // Fetch user's profile details from Firestore
      DocumentSnapshot userDoc = await _firestore
          .collection('receipemgnt') // Replace with your Firestore collection name
          .doc(email) // Assuming email is used as a unique identifier
          .get();

      // Access user-specific data
      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
      String username = userData['username'] ?? 'Username Not Found';

      // Navigate to the next screen or display the user's data
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(username: username),
        ),
      );
    } catch (e) {
      // Handle login errors
      print('Login error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                login(); // Call the login function
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final String username;

  ProfileScreen({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Text('Hello, $username!'),
      ),
    );
  }
}



    /*Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        actions: [],
      ),
      body: Column(
        children: [
          Center(
            child: TextButton.icon(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => signin()));
                },
                icon: Icon(
                  Icons.person_outline,
                  color: Colors.white,
                ),
                label: Text(
                  'Log out',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                )),
          ),

































          //aghi ko chatgpt
        *//*  FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('users')
                .doc('your_document_id',)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Display a loading indicator while data is fetched
              }

              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (!snapshot.hasData || !snapshot.data!.exists) {
                return Text('Document does not exist');
              }

              final data = snapshot.data!.data() as Map<String, dynamic>;
              final email = data['email'] as String;

              return Text('Email: $email');
            },
          ),*//*
//yeha samma
          *//*    FutureBuilder(
              future: _fetch(),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done)
                  return Text("Loading data...Please wait");
                return Text("Email : $myEmail");
              },
            ),
          ),
          FutureBuilder(future: _fetch(), builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done)
              return Text("Loading data...Please wait");
            return Text("Email : $myEmail");
          },
          )*//*
        ],
      ),
    );*/

/*  _fetch() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    await Firestore.instance
        .collection('users')
        .document(firebaseUser?.uid)
        .get()
        .then((ds) {
      myEmail = ds.data['email'];
      print(myEmail);
    }).catchError((e) {
      print(e);
    });
  }
}*/
