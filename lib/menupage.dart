import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class menupage extends StatelessWidget {
  const menupage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Items"),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
        crossAxisCount: 2,
        children: [
          Column(
            children: [

              Column(
             children: [
               Hero(tag: "tag-1",
                 child: GestureDetector(onTap: ()=>Navigator.of(context).push(
                   MaterialPageRoute(builder: (context) => const SecondPage(),
                   ),
                 ),
                   child: Container(

                     height: 105,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20.0),
                       image: const DecorationImage(
                         image: AssetImage("images/menuimage/briyani.jpg"),
                         fit: BoxFit.cover,
                       ),
                     ),
                   ),
                 ),

               ),
               Text("Chicken Briyani", style: TextStyle(
                   fontSize: 20,
                   color: Colors.blue,
                   fontWeight: FontWeight.bold,),),
               Text("RS=250", style: TextStyle(
                   fontSize: 15,
                   color: Colors.blue,
                   fontWeight: FontWeight.bold),),
               Text("3% Cash Back", style: TextStyle(
                   fontSize: 15,
                   color: Colors.blue,
                   fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),


             ],
           ),
            ],
          ),
          Column(
            children: [
              Container(

                height: 105,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: const DecorationImage(
                    image: AssetImage("images/menuimage/burger.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Text("Burger", style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,),),
                  Text("RS=150", style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),),
                  Text("3% Cash Back", style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,decoration: TextDecoration.underline),)
                ],
              ),
            ],
          ),
          Column(
            children: [
              Container(

                height: 105,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: const DecorationImage(
                    image: AssetImage("images/menuimage/crispyfried.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Text("momo", style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,),),
                  Text("RS=150", style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),),
                  Text("3% Cash Back", style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,decoration: TextDecoration.underline),)
                ],
              ),
            ],
          ),
          Column(
            children: [
              Container(

                height: 105,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: const DecorationImage(
                    image: AssetImage("images/kimanoodles.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Text("momo", style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,),),
                  Text("RS=150", style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),),
                  Text("3% Cash Back", style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,decoration: TextDecoration.underline),)
                ],
              ),
            ],
          ),
          Column(
            children: [
              Container(

                height: 105,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: const DecorationImage(
                    image: AssetImage("images/kimanoodles.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Text("momo", style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,),),
                  Text("RS=150", style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),),
                  Text("3% Cash Back", style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,decoration: TextDecoration.underline),)
                ],
              ),
            ],
          ),
          Column(
            children: [
              Container(

                height: 105,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: const DecorationImage(
                    image: AssetImage("images/kimanoodles.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Text("momo", style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,),),
                  Text("RS=150", style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),),
                  Text("3% Cash Back", style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,decoration: TextDecoration.underline),)
                ],
              ),
            ],
          ),



        ],
      ),


    );
  }
}
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Hero(
            tag: "tag-1",
            child: Column(
              children: [
                Container(
                  width: 600,
                  height: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: const DecorationImage(
                      image: AssetImage("images/menuimage/briyani.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text("dfkVideo provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document.kjlkdf"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

