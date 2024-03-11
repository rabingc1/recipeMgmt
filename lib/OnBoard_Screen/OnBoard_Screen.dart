import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../signin.dart';


class OnBoard_Screen extends StatelessWidget {
  const OnBoard_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.black12,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (Context) => signin()),
                );
              },
              child: Text(
                "Skip",
              )
          )
        ],
      ),

      body:Container(
        color: Colors.black26,
        child: CarouselSlider(
          items: [
            //1st Image of Slider
            Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: AssetImage("images/OnBoardImage/1.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //2nd Image of Slider
            Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: AssetImage("images/OnBoardImage/2.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //3rd Image of Slider
            Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: AssetImage("images/OnBoardImage/3.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

          ],

          //Slider Container properties
          options: CarouselOptions(
            height: 900.0,
            enlargeCenterPage: true,
            autoPlay: false,
            aspectRatio: 10 / 2,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            viewportFraction: 0.99,
          ),
        ),
      ),
    );
  }
}/*
Column(
children: [
Container(
color: Colors.red,



child: SafeArea(child: Image.asset("images/OnBoardImage/1.png")),
*//*  margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg/450px-Good_Food_Display_-_NCI_Visuals_Online.jpg"),
                  fit: BoxFit.cover,
                ),
              ),*//*
),
//2nd Image of Slider
],
)*/