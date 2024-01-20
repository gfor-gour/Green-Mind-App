
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_mind/home_screen_std.dart';
import 'package:flutter/cupertino.dart';
import 'package:green_mind/login_screen.dart';
import 'package:green_mind/msg_screen_doc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class HomeScreen_Doc extends StatefulWidget{
  @override
  State <HomeScreen_Doc> createState()=> _homescreen_doc_state();
}

class _homescreen_doc_state extends State<HomeScreen_Doc>{
  int _pageNum = 0;
       var arrNames = ["Gour","Nivrita","Amit","Hasin","Shaeke","Gupal","Shawon","Talukder"];
  @override
  void initState(){
    super.initState();
  }
  void logout() async{
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(context, CupertinoPageRoute(
        builder: (context)=> Login_screen()
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade300,

        actions: <Widget>[
          IconButton(
              onPressed: (){
                    logout();
              },
              icon: const Icon(Icons.logout),color: Colors.black,
          ),

        ],
        leading: IconButton(
          icon: const Icon(Icons.calendar_month),color: Colors.black,
          onPressed: (){
            var calndr_date = showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2022),
              lastDate: DateTime(2100),
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
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.green.shade400,
        height: 60,
        animationDuration: Duration(milliseconds: 300),
        items: [
          Icon(Icons.home),
          Icon(Icons.perm_identity),
          Icon(Icons.settings),
        ],
        onTap: (index){
        setState(() {
          _pageNum = index;
        });
      },
        letIndexChange: (index) => true,
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height:10,
            ),
            //request page , where doctor can view all request
            if(_pageNum==0)
            Container(
              width: 380,
              height: 610,
              child: ListView.separated(itemBuilder: (context,index){
                  return ListTile(
                    tileColor: Colors.green.shade200,
                    leading: Icon(Icons.account_box,size: 30,),
                    title: Text(arrNames[index],
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text('Sent Appointment Request',
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700)
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.forward_to_inbox_outlined),
                      iconSize: 35,
                      color: Colors.black,
                      onPressed: () {
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> MsgScreenDoc(),)
                          );
                      },
                    ),
                  );
                },
                    separatorBuilder: (context, index){
                  return Divider(height:20,thickness: 2,);
                    },
                    itemCount: arrNames.length,

                ),
            ),

            if(_pageNum==1)
              Container(
                  width: double.maxFinite,
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset('assets/images/istockphoto-117613065-612x612.jpg')),
                      ),

                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.black54),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),

                      ProfileMenuwidget(
                          title: "Your Name",
                          subtitle: "Gour Gupal talukder",
                          icon: Icons.person,onPress: () {}),
                      SizedBox(
                        height: 15,
                      ),
                      ProfileMenuwidget(
                          title: "Email",
                          subtitle: "gourgupaltalukder@gmail.com",
                          icon: Icons.person,onPress: () {}),
                      SizedBox(
                        height: 15,
                      ),
                      ProfileMenuwidget(
                          title: "Mobile Number",
                          subtitle: "01746******",
                          icon: Icons.person,onPress: () {}),
                      SizedBox(
                        height: 15,
                      ),
                      ProfileMenuwidget(
                          title: "Password",
                          subtitle: "*******",
                          icon: Icons.person,onPress: () {}),
                    ],
                  )
              ),

            if(_pageNum==2)
              Center(
                child: Container(
                  width: 350,
                  height: 600,
                  color: Colors.blue.shade800,
                  child: Center(
                    child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                              color: Colors.green.shade300,
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                            ),
                            children: <TextSpan>[
                              TextSpan(text:'Under ', style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                              TextSpan(text:'Construction',)
                            ]
                        )
                    ),
                  ),

                ),
              ),
          ],
        ),
      ),
    );
  }
}



class ProfileMenuwidget extends StatelessWidget {
  const ProfileMenuwidget({
    // super.key,
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) ;


  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onPress;
  final Color? textColor;
  final bool endIcon;



  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(0,5),
              color: Colors.blue.shade700.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
            )
          ]
      ),
      child: ListTile(
        title: Text(title,),
        subtitle: Text(subtitle),
        leading: Icon(icon,),
        trailing: endIcon? Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.grey.withOpacity(0.1),
            ),
            child: const Icon(LineAwesomeIcons.angle_right, size: 18.0, color: Colors.black)) : null,
      ),
    );
  }
}