
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_mind/home_screen_doc.dart';
import 'package:green_mind/home_screen_std.dart';
import 'package:green_mind/main.dart';


class Register_screen extends StatefulWidget {
  @override
  State<Register_screen> createState() => _register_screenState();
}

class _register_screenState extends State<Register_screen> {

    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController c_passController = TextEditingController();
    var user_profession = TextEditingController();

    void createAccount() async{
      String email = emailController.text.trim();
      String pass = passController.text.trim();
      String c_pass = c_passController.text.trim();

      if(email == "" || pass == "" || c_pass == ""){
        print("please fillup all the details");
      }
      else if(pass != c_pass){
        print("password do not match!");
      }
      else{
        try{
          UserCredential userCredential = await
        FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass);
        if(userCredential.user != null){
          if(_selected == 'Doctor')
            Navigator.pushReplacement(context, CupertinoPageRoute(
            builder: (context) => HomeScreen_Doc(),
          )
          );
          if(_selected == 'Student')
            Navigator.pushReplacement(context, CupertinoPageRoute(
              builder: (context) => HomeScreen_Std(),
            )
            );
        }
        } on FirebaseAuthException catch(ex){
          print(ex.code.toString());
        }

      }
    }

    final characters = ["Student","Doctor"];
    String? _selected = "";
  _register_screenState(){
        _selected = characters[0];
  }


  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade700,
      ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.blueAccent,

            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
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
                    height: 30,
                  ),
                  Container(
                    width: 300,
                    child: DropdownButtonFormField(

                      value: _selected,
                      // controller: user_profession,
                      items: characters.map(
                        (e) => DropdownMenuItem(child: Text(e), value: e,)
                    ).toList(),
                        onChanged: (val){
                            setState(() {
                              _selected = val as String;
                              // user_profession = _selected as TextEditingController;
                            });
                        },
                      icon: const Icon(
                       Icons.arrow_downward_rounded,
                       color: Colors.black,
                      ),
                      dropdownColor: Colors.blue.shade300,
                      decoration: InputDecoration(
                        labelText: "You are a...",
                        prefixIcon: Icon(
                          Icons.man_2_rounded,
                          color: Colors.black,
                        ),
                        border: UnderlineInputBorder(

                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 300,
                    child: TextField(

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
                        prefixIcon: Icon(Icons.account_circle_outlined,color: Colors.black,),
                        hintText: "Your Name",

                      ),
                    ),
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
                      // controller: emailText,
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
                        prefixIcon: Icon(Icons.phone,color: Colors.black,),
                        hintText: "Phone Number",

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
                        prefixIcon: Icon(Icons.phone,color: Colors.black,),
                        hintText: "Password",

                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 300,
                    child: TextField(
                      controller: c_passController,
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
                        prefixIcon: Icon(Icons.phone,color: Colors.black,),
                        hintText: "Confirm Password",

                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 130,
                    height: 50,
                    color: Colors.blue.shade800,
                    child: OutlinedButton(onPressed: (){
                        createAccount();
                        // if(_selected == 'Doctor')
                        //   Navigator.pushReplacement(context,
                        //       MaterialPageRoute(builder: (context) => HomeScreen_Doc(),)
                        //   );
                        // if(_selected == 'Student')
                        //       Navigator.pushReplacement(context,
                        //           MaterialPageRoute(builder: (context) => HomeScreen_Std(),)
                        //             );
                    }, child: Text(
                      'SignUp',style: TextStyle(color: Colors.black, fontSize: 25),
                    )
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }


}
