
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_mind/home_screen_doc.dart';
import 'package:green_mind/home_screen_std.dart';

class MsgScreenStd extends StatefulWidget{
  @override
  State<MsgScreenStd> createState() => _MsgScreenState_Std();
}

class _MsgScreenState_Std extends State<MsgScreenStd> {
  var arrNames = ["Date: ,Time: ,","Date: ,Time: ,","Date: ,Time: ,"];
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
                MaterialPageRoute(builder: (context)=> HomeScreen_Std(),)
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
      body:  Container(
        width: 380,
        height: 610,
        child: ListView.separated(itemBuilder: (context,index){
          return ListTile(
            tileColor: Colors.green.shade200,
            leading: Icon(Icons.messenger_outline_outlined,size: 30,),
            title: Text(arrNames[index],
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
            ),
            subtitle: Text('at University Center room 212',
                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700)
            ),
          );
        },
          separatorBuilder: (context, index){
            return Divider(height:20,thickness: 2,);
          },
          itemCount: arrNames.length,

        ),
      ),

    );
  }
}