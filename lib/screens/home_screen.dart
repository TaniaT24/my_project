import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_project/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:my_project/reusable_widgets/reusable_widget.dart';
import 'package:my_project/screens/home_screen.dart';
import 'package:my_project/screens/reset_password.dart';
import 'package:my_project/screens/signup_screen.dart';
import 'package:my_project/utils/color_utils.dart';
import 'package:my_project/screens/readBooks.dart';
import 'package:my_project/widgets/customized_button.dart';
import 'package:my_project/screens/Currently.dart';
import 'package:my_project/screens/want_toRead.dart';
import 'package:my_project/screens/Abandonated.dart';
import '../widgets/customized_textfield.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context){
        List<String> images = [
      "assets/images/mak.jpg",
      "assets/images/sa.png",
      "assets/images/ima.jpg",
       "assets/images/aba.jpg",
      
    ];

    return Scaffold(
  body: Container(
        
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: new DecorationImage(image: new AssetImage("assets/images/logodar.jpg"), fit: BoxFit.cover,opacity: 38),
          ),
          
child:
   GridView.builder(
   itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 30,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
     onTap: () {

        if(index==0) Navigator.push( context, MaterialPageRoute(builder: (context) => readBooks()));
        if(index==1) Navigator.push( context, MaterialPageRoute(builder: (context) => want_toRead()));
        if(index==2) Navigator.push( context, MaterialPageRoute(builder: (context) => Currently()));
        if(index==3) Navigator.push( context, MaterialPageRoute(builder: (context) => Abandonated()));
         
        },
     child: Container(
                   
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(images[index],height: 170,width:170,),
                          if(index==0) Text( 'Read Books',
                  style: TextStyle(fontStyle: FontStyle.italic,fontSize: 20, color: Color.fromARGB(255, 44, 14, 3)),
                ),
                  if(index==1) Text( 'Want to read',
                  style: TextStyle(fontStyle: FontStyle.italic,fontSize: 20, color: Color.fromARGB(255, 44, 14, 3)),
                ),
                  if(index==2) Text( 'Currently reading',
                  style: TextStyle(fontStyle: FontStyle.italic,fontSize: 20, color: Color.fromARGB(255, 44, 14, 3)),
                ),
                  if(index==3) Text( 'Abandonated books',
                  style: TextStyle(fontStyle: FontStyle.italic,fontSize: 20, color: Color.fromARGB(255, 44, 14, 3)),
                )
                
                ]
                    
                    , 
                      ),
                    
    ),
                );
    
              },
            ),
          ),
          
           bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 17, 17, 16),
        // this creates a notch in the center of the bottom bar
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen())),
            ),
            IconButton(
              icon: const Icon(
                Icons.login,
                color: Colors.white,
              ),
              onPressed: () =>  Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignInScreen()))
            ),
            const SizedBox(
              width: 20
            ),
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      // implement the floating button
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color.fromARGB(255, 6, 5, 4),
          child: const Icon(Icons.card_giftcard)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

          
          
          
          );
  }
}
