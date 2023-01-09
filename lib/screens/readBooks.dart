import 'dart:developer';
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:my_project/screens/UpdateRecord.dart';
import 'package:my_project/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:my_project/reusable_widgets/reusable_widget.dart';
import 'package:my_project/screens/home_screen.dart';
import 'package:my_project/screens/reset_password.dart';
import 'package:my_project/screens/signup_screen.dart';
import 'package:my_project/utils/color_utils.dart';

import 'package:my_project/widgets/customized_button.dart';

import '../widgets/customized_textfield.dart';
import 'package:firebase_database/firebase_database.dart';

   


class readBooks extends StatefulWidget {
  
const readBooks({Key? key}) : super(key: key);

  @override
  _readBooks createState() => _readBooks();
}

class _readBooks extends State<readBooks> {

   final bookController=TextEditingController();
   final bookName='Book Name';
  
  late DatabaseReference _booksRef; 
  
  final user=FirebaseAuth.instance.currentUser!;


    signOut () async
   {

      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement( context, MaterialPageRoute(builder: (context) => SignInScreen()));
   }

  @override
  
  void initState() {

    final FirebaseDatabase database= FirebaseDatabase.instance;
    _booksRef=database.reference().child(user.uid).child('Read');

    super.initState();
    
  }

  


   List<String> items= ['Read', 'Currently', 'WantToRead'];
   
   String dropdownValue='Read';

  @override
  Widget build(BuildContext context) {
   
   final ref=FirebaseDatabase.instance.reference();

   return Scaffold(
    

   appBar: AppBar( backgroundColor: Color.fromARGB(255, 120, 90, 78),
    title: Text('Read Books'),
   ),
   body: SingleChildScrollView(
        child: Column(
           children:[
             Center(
               child: Container(
                 width: MediaQuery.of(context).size.width,
                 height: MediaQuery.of(context).size.height,
               
                 decoration: BoxDecoration(
                 image: new DecorationImage(image: new AssetImage("assets/images/logodar.jpg"), fit: BoxFit.cover,opacity: 35),),
                 child: Column(
                   children: [
                    Text('      ',textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold ),),
                    TextField(
                       controller: bookController ,
                       textAlign: TextAlign.center ,
                       autofocus: true,
                       cursorColor: Colors.white,
                       
                    

                    ),
                    TextButton(
                      onPressed: () { ref.child(user.uid).child('Read').push().child(bookName).set(bookController.text);
                      bookController.clear();
                      } , 
                      child: Text(' ADD NEW READ BOOK' ,style:TextStyle(color: Colors.white) ,selectionColor: Colors.brown,),
                    ),

                    Flexible(child: new FirebaseAnimatedList(shrinkWrap: true,  query: _booksRef, itemBuilder: (BuildContext context, DataSnapshot snapshot, 
                      Animation<double> animation,
                      int index) {              
                        return new ListTile(
                          trailing: Wrap(children:[ IconButton(icon: Icon(Icons.delete),color: Colors.black, onPressed: () => _booksRef.child(snapshot.key.toString()).remove(),),
                        DropdownButton<String>(
      value: dropdownValue, dropdownColor: Colors.black,
      icon: const Icon(Icons.arrow_downward), iconEnabledColor: Colors.black,
      elevation: 16,
      style: const TextStyle(color: Color.fromARGB(255, 202, 196, 212)),
      underline: Container(
        height: 2,
        color: Color.fromARGB(255, 16, 14, 12),
      ),   
      items: items.map<DropdownMenuItem<String>>((String items) {
        return DropdownMenuItem<String>(
          value: items,
          child: Text(items),
        );
      }).toList(),
      
       onChanged: (String? newvalue) {
        // This is called when the user selects an item.
      

        if(newvalue=='Currently')
        ref.child(user.uid).child(newvalue!).push().child('Book CName').set(snapshot.value['Book Name'] );

       if(newvalue=='WantToRead')
        ref.child(user.uid).child(newvalue!).push().child('Book WName').set(snapshot.value['Book Name'] );


      },
      )
                   ]),
                          title: Text(snapshot.value['Book Name'] ,style: TextStyle(color:Color.fromARGB(255, 74, 73, 73),backgroundColor: Color.fromARGB(196, 255, 219, 219), fontStyle: FontStyle.italic,fontSize: 20,fontWeight:FontWeight.bold),),
                       
                        );
                      })),],
                      ),),),
           ],
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
              onPressed: () => signOut()
              
      
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
     



   );

                 

  }
}