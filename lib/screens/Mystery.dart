import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:my_project/screens/Cont.dart';
import 'package:my_project/screens/Gift.dart';
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



class MysteryScreen extends StatefulWidget {
  const MysteryScreen({Key? key}) : super(key: key);

  @override
  _MysteryScreenState createState() => _MysteryScreenState();
}

class _MysteryScreenState extends State<MysteryScreen> {

Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('We recomand: '),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Never Too Late by Christina Courtenay, A London Season by Patricia Bray , Lily by Patricia Gaffney"),
      ],
    ),
    actions: <Widget>[
      new TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
      
        child: const Text('Close'),
      ),
    ],
  );
}

Widget _buildPopupDialog2(BuildContext context) {
  return new AlertDialog(
    title: const Text('We recomand: '),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("The Kiss Quotient by Helen Hoang,I Kissed Shara Wheeler by Casey McQuiston,Bared to You by Sylvia Day "),
      ],
    ),
    actions: <Widget>[
      new TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
      
        child: const Text('Close'),
      ),
    ],
  );
}

Widget _buildPopupDialog3(BuildContext context) {
  return new AlertDialog(
    title: const Text('We recomand: '),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("The Kiss Quotient by Helen Hoang,I Kissed Shara Wheeler by Casey McQuiston,Bared to You by Sylvia Day "),
      ],
    ),
    actions: <Widget>[
      new TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
      
        child: const Text('Close'),
      ),
    ],
  );
}

Widget _buildPopupDialog4(BuildContext context) {
  return new AlertDialog(
    title: const Text('We recomand: '),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("The Kiss Quotient by Helen Hoang,I Kissed Shara Wheeler by Casey McQuiston,Bared to You by Sylvia Day "),
      ],
    ),
    actions: <Widget>[
      new TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
      
        child: const Text('Close'),
      ),
    ],
  );
}


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
                              '    Your friend favourite book?',
                              style: TextStyle(fontStyle: FontStyle.italic,fontSize: 21.5,letterSpacing:3 ,fontWeight:FontWeight.bold),
                              
         ),
         
            Card( margin:EdgeInsets.only(top:120,left:100),
            child: 
             Padding( 
                padding: const EdgeInsets.all(10.0),
                child: TextButton(   onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog(context),
            );
          },
                  child:Text('  Ten little Indians    ',
                  style: TextStyle(fontSize: 20.0),)
                  
                  
                   )
                ),),

        
             Card( margin:EdgeInsets.only(top: 5,left: 100),
            child: 
             Padding( 
                padding: const EdgeInsets.all(5.0),
                child: TextButton( onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog2(context),
            );
          }, child: Text(' Cianura pentru un suras',
                  style: TextStyle(fontSize: 20.0),
                ),
                ),
                ),

             ),
            Card( margin:EdgeInsets.only(top: 5,left: 100),
            child: 
             Padding( 
                padding: const EdgeInsets.all(8.0),
                child:TextButton(onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog3(context),
            );
          }, child:  Text('Misterul Camerei Galbene',
                  style: TextStyle(fontSize: 20.0),
                ),),),
            ),
                 Card( margin:EdgeInsets.only(top: 5,left: 100),
            child: 
             Padding( 
                padding: const EdgeInsets.all(8.0),
                child: TextButton(onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog4(context),
            );
          }, child: 
                  
                  
                   Text(' Capitanul Apostolescu  ',
                  style: TextStyle(fontSize: 20.0),
                ),),),


                 ),




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
