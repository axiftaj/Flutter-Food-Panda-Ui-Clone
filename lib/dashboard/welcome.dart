import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:instagram_clone/constats/color.dart';
import 'package:instagram_clone/constats/constants.dart';
import 'package:instagram_clone/dashboard/home.dart';
import 'package:instagram_clone/model/panda_pick_model/pandaPickHelper.dart';
import 'package:instagram_clone/model/panda_pick_model/pandaPickItemModel.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    final height  = MediaQuery.of(context).size.height * 1 ;
    final width  = MediaQuery.of(context).size.width * 1 ;
    return Scaffold(
      appBar: AppBar(
        title: const  Text('New Your City') ,
        actions: const[
          Icon(Icons.shopping_bag_outlined),
          SizedBox(width: 10,)
        ],
        bottom: PreferredSize(
          preferredSize:const Size.fromHeight(40),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
            child: Row(
              children:  [
                Expanded(child: CupertinoTextField(
                  padding: EdgeInsets.symmetric(vertical: 12 , horizontal: 10),
                  placeholder: "Seach for shop & restaurants",
                  prefix: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(Icons.search , color: Color(0xff7b7b7b) ,),
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xfff7f7f7),
                      borderRadius : BorderRadius.circular(50)
                  ),
                  style: TextStyle(color: Color(0xff707070) ,
                      fontSize: 12, fontFamily: Regular) ,
                )),
              ],
            ),
          ),
        ),
      ),

      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15 ,vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             InkWell(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
               },
               child: Container(
                 height: MediaQuery.of(context).size.height * .18,
                 width: double.infinity,
                 decoration: BoxDecoration(
                   color: MyColors.primaryColor,
                   borderRadius: BorderRadius.circular(10)
                 ),
                 child: Stack(
                   alignment: Alignment.bottomLeft,
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisSize: MainAxisSize.min,
                         children: [
                           Text('Food delivery' , style: TextStyle(color: Colors.white , fontFamily: Bold, fontSize: 18 ),),
                           Text('Order from your faviruite\nrestaurants and home chefs' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.w500 ,height:1 , fontFamily: Light, fontSize: 14  )),
                         ],
                       ),
                     )
                   ],
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 10),
               child: Row(
                 children: [
                   Expanded(
                     flex: 1,
                     child: Container(
                       height: MediaQuery.of(context).size.height * .25,

                       decoration: BoxDecoration(
                           color: Colors.yellow.withOpacity(0.6),
                           borderRadius: BorderRadius.circular(10)
                       ),
                     ),
                   ),
                   SizedBox(width: 10,),
                   Expanded(
                     flex: 1,
                     child: Column(
                       children: [
                         Container(
                           height: MediaQuery.of(context).size.height * .15,
                           decoration: BoxDecoration(
                               color: Colors.pink.withOpacity(0.4),
                               borderRadius: BorderRadius.circular(10)
                           ),
                         ),
                         SizedBox(height: 5),
                         Container(
                           height: MediaQuery.of(context).size.height * .1,
                           decoration: BoxDecoration(
                               color: Colors.blue.withOpacity(0.5),
                               borderRadius: BorderRadius.circular(10)
                           ),
                         )
                       ],
                     ),
                   ),

                 ],
               ),
             ),
             Text('Your daily deals' , style: TextStyle(color: Color(0xff323232) , fontSize: 15, fontFamily: Bold),),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 10),
               child: Container(
                 height: MediaQuery.of(context).size.height * .278,
                 child: ListView.builder(
                     itemCount: PandaPickHelper.itemCount,
                     scrollDirection: Axis.horizontal,
                     itemBuilder: (context, index){
                       PandaPickItemModel model = PandaPickHelper.getStatusItem(index);
                       return InkWell(
                         onTap: (){
                         },
                         child: Padding(
                           padding: const EdgeInsets.only(right: 10),
                           child: Container(
                             height: height * .3,
                             width: width * .6,
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Stack(
                                   children: [
                                     ClipRRect(
                                         borderRadius: BorderRadius.circular(10),
                                         child: Image(
                                             fit: BoxFit.cover,
                                             height: height * .2,
                                             image: NetworkImage(model.image))),
                                     Padding(
                                       padding: const EdgeInsets.symmetric(vertical: 15),
                                       child: Container(
                                         decoration: BoxDecoration(
                                             color: MyColors.primaryColor,
                                             borderRadius: BorderRadius.only(
                                               topRight: Radius.circular(20),
                                               bottomRight: Radius.circular(20),
                                             )
                                         ),
                                         child:  Padding(
                                           padding: const EdgeInsets.only(top: 7, left: 5 , right: 10, bottom: 7),
                                           child: Text("Flash 20% OFF" , style: TextStyle(color: Colors.white , fontSize: 10, fontFamily: Bold),),
                                         ),

                                       ),
                                     ),
                                     Positioned(
                                       bottom: 0,
                                       left: 10 ,
                                       child: Padding(
                                         padding: const EdgeInsets.symmetric(vertical: 10),
                                         child: Container(
                                           decoration: BoxDecoration(
                                               color: Color(0xfffffcff),
                                               borderRadius: BorderRadius.circular(20.0)
                                           ),
                                           child:  Padding(
                                             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                             child: Text(model.remaingTime , style: TextStyle(color: blackColor , fontSize: 12, fontFamily: Bold),),
                                           ),

                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                                 SizedBox(height: 5  ,),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text(model.name , style: TextStyle(color: Color(0xff323232) , fontSize: 14, fontFamily: Bold),),
                                     Row(
                                       children: [
                                         RatingBarIndicator(
                                           rating: 2.75,
                                           itemBuilder: (context, index) => Icon(
                                             Icons.star,
                                             color: Colors.amber,
                                           ),
                                           itemCount: 1,
                                           itemSize: 19.0,
                                           direction: Axis.horizontal,
                                         ),
                                         Text(" "+model.ratting , style: TextStyle(color: Color(0xff323232) , fontSize: 12, fontFamily: Bold),),
                                         Text("  ("+model.totalRating+")" , style: TextStyle(color: Color(0xffa9a9a9) ,
                                             fontSize: 12, fontFamily: Light),),

                                       ],
                                     )
                                   ],
                                 ),
                                 SizedBox(height: 3,),
                                 SizedBox(height: 3,),
                                 Text(r"$ • "+model.subTitle, style: TextStyle(color: Color(0xff707070) ,
                                     fontSize: 12, fontFamily: Regular),),
                                 SizedBox(height: 3,),
                                 Row(
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                     Icon(Icons.directions_bike , size: 14  , color: MyColors.primaryColor,),
                                     Text(r"  Rs  "+model.deliveryPrice, style: TextStyle(color: Color(0xff707070) ,
                                         fontSize: 12, fontFamily: Regular),),

                                   ],
                                 )

                               ],
                             ),
                           ),
                         ),
                       );
                     }),
               ),
             ),
           ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: MyColors.primaryColor,
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage('https://images.pexels.com/photos/1435907/pexels-photo-1435907.jpeg?cs=srgb&dl=pexels-engin-akyurt-1435907.jpg&fm=jpg'),
              ),
            ),
            ListTile(
              title: const Text('Setting' , style: TextStyle(fontFamily: Medium , color : Colors.black)),
              leading: Icon(Icons.settings_outlined , color: MyColors.primaryColor,),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Help center 2' , style: TextStyle(fontFamily: Medium , color : Colors.black)),
              leading: Icon(Icons.help_outline, color: MyColors.primaryColor),

              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('More' , style: TextStyle(fontFamily: Medium , color : Colors.black)),
              leading: Icon(Icons.more_horiz, color: MyColors.primaryColor),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Sign up or Login in' , style: TextStyle(fontFamily: Medium , color : Colors.black)),
              leading: Icon(Icons.login_outlined, color: MyColors.primaryColor),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
