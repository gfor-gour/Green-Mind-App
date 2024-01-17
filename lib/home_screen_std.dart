
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class HomeScreen_Std extends StatefulWidget{
  @override
  State <HomeScreen_Std> createState() => _homescreen_std_state();
}

class _homescreen_std_state extends State<HomeScreen_Std>{
  int _pageNum=0;
    bool isPressed = false;
    String changetxt ='Send Appointment Request';
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

      body:
            Container(
              // width: double.infinity,
              // height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),

                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                            color: Colors.green.shade600,
                            fontSize: 45,
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

                  if(_pageNum==0)
                    Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),

                          Container(
                            width: 300,
                            child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(text: 'It’s okay to not be okay. \n', ),
                                      TextSpan(text:'It’s okay to ask for help. \n',
                                          style: TextStyle(color: Colors.green.shade900)),
                                      TextSpan(text:'It’s okay to reach out to someone. '),
                                      TextSpan(text:'You’re not alone' ,style: TextStyle(color: Colors.green.shade900)),
                                    ]
                                )

                            ),
                          ),
                          SizedBox(
                            height: 80,
                          ),

                          Container(
                            width: 300,
                            child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(text: 'thinking of talking with a psychiatrist?', ),

                                    ]
                                )

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
                                    changetxt = 'Request Sent';
                                    if(!isPressed) isPressed = !isPressed;

                                  });
                                }, child: Text(
                              '$changetxt',style: TextStyle(color: Colors.black),
                            )
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Container(
                            child:Image.asset('assets/images/istockphoto-1308800381-612x612.jpg') ,
                          ),
                        ],
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

