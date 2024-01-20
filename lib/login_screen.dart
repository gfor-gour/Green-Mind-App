
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_mind/home_screen_doc.dart';
import 'package:green_mind/home_screen_std.dart';
import 'package:green_mind/main.dart';
import 'package:green_mind/register_screen.dart';
import 'package:green_mind/splash_screen.dart';

class Login_screen extends StatefulWidget{
  // var name_prfession_regiScreen ;
  // Login_screen(this.name_prfession_regiScreen);
  @override
  State <Login_screen> createState() => _Login_screenState();

}

class _Login_screenState extends State<Login_screen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void login() async {
    String email = emailController.text.trim();
    String pass = passController.text.trim();

    if(email == "" || pass == ""){
      print("please fillup all the details");
    }
    else{
      try{
        UserCredential userCredential = await
        FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass);

        if(userCredential.user != null){
          // Navigator.popUntil(context,(route) => route.isFirst);

          Navigator.pushReplacement(context,
              CupertinoPageRoute(builder:
                  (context) => HomeScreen_Std(),
              )
          );
        }
      } on FirebaseAuthException catch(ex){
        print(ex.code.toString());
      }

    }
  }

  var emailText = TextEditingController();
  var passText = TextEditingController();
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(

       body: Container(
           width: double.infinity,
           height: double.infinity,
           color: Colors.blueAccent,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,

             children: [
               RichText(
                   text: TextSpan(
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 35,
                       fontWeight: FontWeight.bold,
                     ),
                      children: <TextSpan>[
                        TextSpan(text:'Green ', style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                        TextSpan(text:'Mind',)
                      ]
                   )
               ),
               SizedBox(
                 height: 10,
               ),
               Container(
                 width: 300,
                 child: TextField(
                   controller: emailController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 3,
                          )
                      ),

                        enabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.circular(21),
                            borderSide: BorderSide(
                              color: Colors.black38,
                              width: 2,
                            )
                        ),
                      prefixIcon: Icon(Icons.email,color: Colors.black,),
                      hintText: "Email",

                    ),
                 ),
               ),
               SizedBox(
                 height: 10,
               ),
               Container(
                 width: 300,
                 child: TextField(
                   controller: passController,
                   obscureText: true,
                   obscuringCharacter: "*",
                   decoration: InputDecoration(

                       focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(21),
                           borderSide: BorderSide(
                             color: Colors.black,
                             width: 3,
                           )
                       ),
                       enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(21),
                           borderSide: BorderSide(
                             color: Colors.black38,
                             width: 2,
                           )
                       ),
                     prefixIcon: Icon(Icons.lock_clock_sharp,color: Colors.black,),
                     hintText: "Password",

                   ),
                 ),
               ),
               SizedBox(
                 height: 10,
               ),
               Container(
                     width: 90,
                     height: 35,
                     color: Colors.blue.shade800,
                     child: OutlinedButton(onPressed: (){
                       login();
                       // String uEmail = emailText.text.toString();
                       // String uPass = passText.text.toString();
                          // Navigator.push(context,
                          // MaterialPageRoute(builder:
                          //     (context) => HomeScreen_Std(),)
                          // );
                     }, child: Text(
                       'LOG IN',style: TextStyle(color: Colors.black),
                     )),
                   ),

               SizedBox(
                 height: 10,
               ),
               Container(
                     width: 100,
                     height: 40,
                     color: Colors.blue.shade800,
                     child: OutlinedButton(onPressed: (){
                       Navigator.push(context,
                         MaterialPageRoute(builder: (context) => Register_screen(),)
                       );
                     }, child: Text(
                       'REGISTER',style: TextStyle(color: Colors.black),
                     )
                     ),
                   ),
             ],

           ),
         )
     );
  }


}