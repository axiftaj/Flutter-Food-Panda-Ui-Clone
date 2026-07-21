
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/compnents/restuarent.dart';
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
                  padding: const EdgeInsets.symmetric(vertical: 12 , horizontal: 10),
                  placeholder: "Seach for shop & restaurants",
                  prefix: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(Icons.search , color: Color(0xff7b7b7b) ,),
                  ),
                  decoration: BoxDecoration(
                      color: const Color(0xfff7f7f7),
                      borderRadius : BorderRadius.circular(50)
                  ),
                  style: const TextStyle(color: Color(0xff707070) ,
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
             ClipRRect(
               borderRadius: BorderRadius.circular(10),
               child: InkWell(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
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
                       const Image(
                           fit: BoxFit.fitWidth,
                           width: double.infinity,
                           image: NetworkImage('https://cdn.pixabay.com/photo/2021/01/16/09/05/meal-5921491_960_720.jpg')),
                       Padding(
                         padding: const EdgeInsets.all(6.0),
                         child: Container(
                         
                           child: const Padding(
                             padding: EdgeInsets.all(8.0),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisSize: MainAxisSize.min,
                               children: [
                                 Text('Food delivery' , style: TextStyle(color: Colors.white , fontFamily: Bold, fontSize: 18 ),),
                                 Text('Order from your faviruite\nrestaurants and home chefs' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.w500 ,height:1 , fontFamily: Medium, fontSize: 14  )),

                               ],
                             ),
                           ),
                         ),
                       )
                     ],
                   ),
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
                           color: const Color(0xfffed271),
                           borderRadius: BorderRadius.circular(10)
                       ),
                       child: const Padding(
                         padding: EdgeInsets.all(10.0),
                         child: Stack(
                           alignment: Alignment.center,
                           children: [
                             CircleAvatar(
                               radius: 50,
                               backgroundImage: AssetImage('assets/pandamart.jpg'),
                             ),
                             Positioned(
                                 bottom: 15,
                                 left: 0,
                                 child: Text('pandamart' , style: TextStyle(color: blackColor , fontFamily: Bold, fontSize: 18 ),)),
                             Positioned(
                                 bottom: 0,
                                 left: 0,
                                 child: Text('panda20 for 20% off' , style: TextStyle(color: blackColor , fontWeight: FontWeight.w500 ,height:1 , fontFamily: Medium, fontSize: 14  ))),

                           ],
                         ),
                       ),
                     ),
                   ),
                   const SizedBox(width: 8,),
                   Expanded(
                     flex: 1,
                     child: Column(
                       children: [
                         Container(
                           height: MediaQuery.of(context).size.height * .15,
                           width: double.infinity,
                           decoration: BoxDecoration(
                               color: const Color(0xffef9fc4),
                               borderRadius: BorderRadius.circular(10),
                             image: const DecorationImage(
                                 image: AssetImage('assets/food.jpg')

                             )
                           ),
                           child: const Padding(
                             padding: EdgeInsets.all(10.0),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.end,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text('Pick-Uo' , style: TextStyle(color: blackColor , fontFamily: Bold, fontSize: 18 ),),
                                 Text('Upto 50% off' , style: TextStyle(color: blackColor , fontWeight: FontWeight.w500 ,height:1 , fontFamily: Medium, fontSize: 14  )),

                               ],
                             ),
                           ),
                         ),
                         const SizedBox(height: 5),
                         Container(
                           height: MediaQuery.of(context).size.height * .1,
                           width: double.infinity,
                           decoration: BoxDecoration(
                               color: const Color(0xff85bfff),
                               borderRadius: BorderRadius.circular(10)
                           ),
                           child: const Padding(
                             padding: EdgeInsets.all(10.0),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.end,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text('Shops' , style: TextStyle(color: blackColor , fontFamily: Bold, fontSize: 18 ),),
                                 Text('Everyday assentials' , style: TextStyle(color: blackColor , fontWeight: FontWeight.w500 ,height:1 , fontFamily: Medium, fontSize: 14  )),

                               ],
                             ),
                           ),

                         )
                       ],
                     ),
                   ),

                 ],
               ),
             ),
             const Text('Your daily deals' , style: TextStyle(color: Color(0xff323232) , fontSize: 15, fontFamily: Bold),),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 10),
               child: SizedBox(
                 height: MediaQuery.of(context).size.height * .278,

                 child: ListView.builder(
                     itemCount: PandaPickHelper.itemCount,
                     scrollDirection: Axis.horizontal,
                     itemBuilder: (context, index){
                       PandaPickItemModel model = PandaPickHelper.getStatusItem(index);
                       return RestuarentScreen(
                         name: model.name,
                         image:model.image ,
                         remainingTime: model.remaingTime,
                         totalRating: model.totalRating,
                         subTitle: model.subTitle,
                         rating: model.ratting,
                         deliveryTime: model.remaingTime, deliveryPrice: model.deliveryPrice,
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
                radius: 24,
                backgroundImage: NetworkImage('https://media-exp1.licdn.com/dms/image/C5603AQFtuW78eNazIw/profile-displayphoto-shrink_800_800/0/1567442703746?e=2147483647&v=beta&t=N5dGxws3xJIhwPM8w_i4dlX8qLmxznmVykPCTccYHj8'),

              ),
            ),
            ListTile(
              title: const Text('Setting' , style: TextStyle(fontFamily: Medium , color : Colors.black)),
              leading: const Icon(Icons.settings_outlined , color: MyColors.primaryColor,),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Help center 2' , style: TextStyle(fontFamily: Medium , color : Colors.black)),
              leading: const Icon(Icons.help_outline, color: MyColors.primaryColor),

              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('More' , style: TextStyle(fontFamily: Medium , color : Colors.black)),
              leading: const Icon(Icons.more_horiz, color: MyColors.primaryColor),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Sign up or Login in' , style: TextStyle(fontFamily: Medium , color : Colors.black)),
              leading: const Icon(Icons.login_outlined, color: MyColors.primaryColor),
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
