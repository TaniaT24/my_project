import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:my_project/screens/Gift.dart';
import 'package:my_project/screens/change_pass.dart';
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




class ContScreen extends StatefulWidget {
  const ContScreen({Key? key}) : super(key: key);

  @override
  _ContScreenState createState() => _ContScreenState();
}

class _ContScreenState extends State<ContScreen> {


 final user=FirebaseAuth.instance.currentUser!;



   final ref=FirebaseDatabase.instance.reference();



    signOut () async
   {

      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement( context, MaterialPageRoute(builder: (context) => SignInScreen()));
   }


  @override
  Widget build(BuildContext context){
  

    return Scaffold(
  body: Container(
        
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: new DecorationImage(image: new AssetImage("assets/images/logodar.jpg"), fit: BoxFit.cover,opacity: 38),
          ),
        child:
  SizedBox(
  
    height: 210,
    child: Card(
      child: Column(
        children: [
          ListTile(
            title: Text('My Account'),
           
            leading: Icon(
              Icons.restaurant_menu,
              color: Colors.blue[500],
            ),
          ),
          const Divider(),
          ListTile(
            title:Text(
              user.email!,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            leading: Icon(
              Icons.email,
              color: Colors.blue[500],
              
            ),
          ),
          ListTile(  title:Text("Change your password") , leading:
            IconButton(
              icon: const Icon(
                Icons.password,
                color: Color.fromARGB(255, 26, 41, 155),
              ),
              onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ChangePass())),
              
      
            ),


          ),
          
        ],
      ),
    ),
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
              onPressed: () =>  signOut()
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
              onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ContScreen())),
            ),
          ],
        ),
      ),
      // implement the floating button
      floatingActionButton: FloatingActionButton(
          onPressed:   () => Navigator.push( context, MaterialPageRoute(builder: (context) => GiftScreen())),
          backgroundColor: Color.fromARGB(255, 6, 5, 4),
          child: const Icon(Icons.card_giftcard)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

          
          
          
          );
  }
}
