
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_mind/home_screen_doc.dart';

class MsgScreenDoc extends StatefulWidget{
  @override
  State<MsgScreenDoc> createState() => _MsgScreenState();
}

class _MsgScreenState extends State<MsgScreenDoc> {
  bool isPressed = false;
  String changetxt ='Send Message';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade300,

        actions: <Widget>[
          IconButton(
            onPressed: (){
              var calndr_date = showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2022),
                lastDate: DateTime(2100),
              );
            },
            icon: const Icon(Icons.calendar_month),color: Colors.black,
          ),

        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),color: Colors.black,
          onPressed: (){
            Navigator.pop(context,
                MaterialPageRoute(builder: (context)=> HomeScreen_Doc(),)
            );
          },
        ),
        title: RichText(
            text: TextSpan(
                style: TextStyle(
                  color: Colors.green.shade600,
                  fontSize: 40,
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
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 330,
              child: TextField(
                  maxLength: 150,
                // controller: emailController,
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
                  hintText: "Send date,Time and address",

                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 250,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: isPressed? Colors.white24 : Colors.blue
                  ),
                  onPressed: (){
                    setState(() {
                      changetxt = 'Message Sent';
                      if(!isPressed) isPressed = !isPressed;

                    });
                  }, child: Text(
                '$changetxt',style: TextStyle(color: Colors.black),
              )
              ),
            ),
          ],
        ),
      ),

    );
  }
}