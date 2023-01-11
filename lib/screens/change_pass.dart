import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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


class ChangePass extends StatefulWidget {

  @override
  _ChangePassState createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {

  final _formKey=GlobalKey<FormState>();
   late String newPassword;
  final newPasswordControler=TextEditingController();
  final currentUser= FirebaseAuth.instance.currentUser;

  @override
  void dispose()
  {
    newPasswordControler.dispose();
    super.dispose();
  }



  changePassword() async
  {
    try{

    await currentUser!.updatePassword(newPassword);
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SignInScreen()),
  
    );

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.black,content: Text('Your password has been changed...Login again'),),
     );



    } catch(error)
    {



    }

  }

   @override
   Widget build(BuildContext context)
{
 return Scaffold
(backgroundColor: Colors.white,
body: Form(key: _formKey,
   child: Padding(
    padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 25.0),
    child: ListView(children: [SizedBox(height: 100,),
    Padding(padding: const EdgeInsets.all(10.0),
    child: Image.asset("assets/images/logodar.jpg"),
    ),
    Container(
     margin: EdgeInsets.symmetric(vertical: 10.0),
     child: TextFormField(autofocus: false,obscureText: true,
          decoration: InputDecoration(
               labelText: 'New Password',
               hintText: 'Enter New Password',
               labelStyle: TextStyle(fontSize: 20.0),
               border: OutlineInputBorder(),
               errorStyle: TextStyle(color: Colors.black,fontSize: 15.0),
          ),

          controller: newPasswordControler,
            validator: (value){

              if(value==null || value.isEmpty)
               {return  'Please enter Password';}

           return null;


            },



        ),


    ),
    
   ElevatedButton( onPressed: (){

   if(_formKey.currentState!.validate())
   {
    setState(() {
      newPassword=newPasswordControler.text;
    });
    changePassword();
   }


   }, child:  Text('Change Password',style: TextStyle(fontSize: 18.0), )),

    ],
    ),
   ),
  )



);



}



  }

