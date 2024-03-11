
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recipemgmt/routing_page.dart';
import 'package:recipemgmt/signin.dart';
import 'OnBoard_Screen/OnBoard_Screen.dart';
/*

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({Key? key}):super (key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home: signin(),
        debugShowCheckedModeBanner: false
    );
  }
}*/
import 'package:flutter/material.dart';

import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

import 'homepage.dart';
import 'id.dart';
import 'menupage.dart';

void main()
  async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Color.fromARGB(255, 232, 234, 222),
      ),
      home:  signin()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController _pageController;
  int selectedIndex = 0;
  bool _colorful = false;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Receipe manager"),


      ),
      drawer: Container(
        width: 300,
        child:   Drawer(
          child: ListView(
            children: [
              DrawerHeader(

                margin: EdgeInsets.all(0.0),
                decoration: BoxDecoration(

                  image: DecorationImage(

                      image: AssetImage("images/menuimage/crispyfried.jpg",),
                      fit: BoxFit.cover),
                ),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                      AssetImage("images/menuimage/crispyfried.jpg",),
                      backgroundColor: Colors.transparent,
                    ),
                    Container(
                      height: 3,
                    ),
                    Text(
                      'RECEIPE MANAGER',style: TextStyle(fontSize: 20,color: Colors.white
                    ),
                    ),

                  ],
                ),
              ),
              Container(

                height: 680,

                color: Colors.black87,

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      children:[
                        ListTile(
                            leading: Icon(
                              Icons.home,
                              size: 35,
                              color: Colors.white,
                            ),
                            title: Text("Home", style: TextStyle(fontSize: 20,color: Colors.white),),
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>homepage()),
                              );
                            }
                        ),
                        ListTile(
                            leading: Icon(
                              Icons.menu_book,
                              size: 35,
                              color: Colors.white,
                            ),
                            title: Text("Menu", style: TextStyle(fontSize: 20,color: Colors.white),),
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => menupage()),
                              );
                            }

                        ),
                        ListTile(
                            leading: Icon(
                              Icons.content_copy,
                              size: 35,
                              color: Colors.white,
                            ),
                            title: Text("Privacy Policy", style: TextStyle(fontSize: 20,color: Colors.white),),
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => menupage()),
                              );
                            }

                        ),
                        ListTile(
                            leading: Icon(
                              Icons.info_outline,
                              size: 35,
                              color: Colors.white,
                            ),
                            title: Text("about", style: TextStyle(fontSize: 20,color: Colors.white),),
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => menupage()),
                              );
                            }

                        ),





                      ] ),
                ),

              ),



            ],
          ),
        ),
      ),

      body: Column(
        children: <Widget>[
          /* SafeArea(
              child: SwitchListTile(
                title: const Text('food'),
                value: _colorful,
                onChanged: (bool value) {
                  setState(() {
                    _colorful = !_colorful;
                  });
                },
              )),*/
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: _listOfWidget,
            ),
          ),
        ],
      ),
      bottomNavigationBar: _colorful
          ? SlidingClippedNavBar.colorful(
        backgroundColor: Colors.white,
        onButtonPressed: onButtonPressed,
        iconSize: 25,
        // activeColor: const Color(0xFF01579B),
        selectedIndex: selectedIndex,
        barItems: <BarItem>[
          BarItem(
            icon: Icons.home,
            title: 'Home',
            activeColor: Colors.blue,
            inactiveColor: Colors.orange,
          ),
          BarItem(
            icon: Icons.favorite_border,
            title: 'Favorite',
            activeColor: Colors.yellow,
            inactiveColor: Colors.green,
          ),
          BarItem(
            icon: Icons.add_shopping_cart_sharp,
            title: 'Cart',
            activeColor: Colors.blue,
            inactiveColor: Colors.red,
          ),
          BarItem(
            icon: Icons.perm_identity,
            title: 'Id',
            activeColor: Colors.cyan,
            inactiveColor: Colors.purple,
          ),

        ],
      )
          : SlidingClippedNavBar(
        backgroundColor: Colors.white,
        onButtonPressed: onButtonPressed,
        iconSize: 30,
        activeColor: const Color(0xFF01579B),
        selectedIndex: selectedIndex,
        barItems: <BarItem>[
          BarItem(
            icon: Icons.home,
            title: 'Home',
          ),
          BarItem(
            icon: Icons.favorite_border,
            title: 'Favorite',
          ),
          BarItem(
            icon: Icons.local_offer,
            title: 'Offer',
          ),
          BarItem(
            icon: Icons.perm_identity,
            title: 'Id',
          ),

        ],
      ),
    );
  }
}

// icon size:24 for fontAwesomeIcons
// icons size: 30 for MaterialIcons

List<Widget> _listOfWidget = <Widget>[
  Container(
      alignment: Alignment.center,
      child: homepage()
  ),
  Container(
      alignment: Alignment.center,
      child: Text("Fab food comming soon")
  ),
  Container(
      alignment: Alignment.center,
      child: Text("Add to cart list comming soon")
  ),
  Container(
      alignment: Alignment.center,
      child: id()
  ),



];
