import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:my_project/screens/Cont.dart';
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



class GiftScreen extends StatefulWidget {
  const GiftScreen({Key? key}) : super(key: key);

  @override
  _GiftScreenState createState() => _GiftScreenState();
}

class _GiftScreenState extends State<GiftScreen> {


 final user=FirebaseAuth.instance.currentUser!;


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
       
       child:  Container( 
        margin:EdgeInsets.symmetric(vertical: 130.0),
         child:   Wrap(children:[  Text(          
                              '    Your friend favourite genre?',
                              style: TextStyle(fontStyle: FontStyle.italic,fontSize: 21.5,letterSpacing:3 ,fontWeight:FontWeight.bold),
                              
         ),
         
            Card( margin:EdgeInsets.only(top:120,left:120),
            child: 
             Padding( 
                padding: const EdgeInsets.all(20.0),
                child: TextButton(onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ContScreen())),
                  child:Text('Romance',
                  style: TextStyle(fontSize: 22.0),)
                  
                  
                   )
                ),),

        
             Card( margin:EdgeInsets.only(top: 5,left: 120),
            child: 
             Padding( 
                padding: const EdgeInsets.all(20.0),
                child: Text('   Crime   ',
                  style: TextStyle(fontSize: 22.0),
                ),),),





         ],
        
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
          onPressed: () =>  Navigator.push(
            context, MaterialPageRoute(builder: (context) => GiftScreen())),
          backgroundColor: Color.fromARGB(255, 6, 5, 4),
          child: const Icon(Icons.card_giftcard)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

          
          
          
          );
  }
}
