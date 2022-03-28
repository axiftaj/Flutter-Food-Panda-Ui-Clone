import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:instagram_clone/constats/color.dart';
import 'package:instagram_clone/constats/constants.dart';
import 'package:instagram_clone/dashboard/detail_screen.dart';
import 'package:instagram_clone/model/exclusive_panda_model/exclusiveHelper.dart';
import 'package:instagram_clone/model/exclusive_panda_model/exclusive_item_model.dart';
import 'package:instagram_clone/model/panda_pick_model/pandaPickHelper.dart';
import 'package:instagram_clone/model/panda_pick_model/pandaPickItemModel.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: 'Search for restaurant,cuisones, and dishes');
  }

  @override
  Widget build(BuildContext context) {
    final height  = MediaQuery.of(context).size.height * 1 ;
    final width  = MediaQuery.of(context).size.width * 1 ;

    return Scaffold(
      appBar: AppBar(
        title: const  Text('Food Delivery'),
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
                    controller: _textController,
                  padding: EdgeInsets.symmetric(vertical: 12 , horizontal: 10),
                  placeholder: "asdf",
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
                SizedBox(width: 10,),
                Icon(Icons.filter_list_outlined, color: MyColors.primaryColor,)
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
        child: SingleChildScrollView(
          child: Container(
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Panda Pick' , style: TextStyle(color: Color(0xff323232) , fontSize: 15, fontFamily: Bold),),
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(name: model.name, image: model.image)));
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
                                                image: AssetImage(model.image))),
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
                Text('Panda exclusives' , style: TextStyle(color: Color(0xff323232) , fontSize: 15, fontFamily: Bold),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .27,
                    child: ListView.builder(
                        itemCount: ExclusiveHelper.itemCount,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          ExclusiveItemModel model = ExclusiveHelper.getStatusItem(index);
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(name: model.name, image: model.image)));
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
                                                image: AssetImage(model.image))),
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
                                            Text(" "+model.rating , style: TextStyle(color: Color(0xff323232) , fontSize: 12, fontFamily: Bold),),
                                            Text("  ("+model.totalRating +")" , style: TextStyle(color: Color(0xffa9a9a9) ,
                                                fontSize: 12, fontFamily: Light),),

                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 3,),
                                    Text(r"$ • "+model.subTitle, style: TextStyle(color: Color(0xff707070) ,
                                        fontSize: 12, fontFamily: Regular),),
                                    SizedBox(height: 3,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(Icons.directions_bike , size: 14  , color: MyColors.primaryColor,),
                                        Text( model.deliveryPrice == 'Free Delivery' ? '  Free Delivery' : r"  Rs  "+model.deliveryPrice, style: TextStyle(color: Color(0xff707070) ,
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
                Text('All Restuarent' , style: TextStyle(color: Color(0xff323232) , fontSize: 15, fontFamily: Bold),),
                Container(
                  height: height * .3,
                  child: ListView.builder(
                      itemCount: ExclusiveHelper.itemCount,
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index){
                        ExclusiveItemModel model = ExclusiveHelper.getStatusItem(index);
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(name: model.name, image: model.image)));
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
                                              width: width * 1,
                                              height: height * .2,
                                              image: AssetImage(model.image))),
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
                                          Text(" "+model.rating , style: TextStyle(color: Color(0xff323232) , fontSize: 12, fontFamily: Bold),),
                                          Text("  ("+model.totalRating +")" , style: TextStyle(color: Color(0xffa9a9a9) ,
                                              fontSize: 12, fontFamily: Light),),

                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 3,),
                                  Text(r"$ • "+model.subTitle, style: TextStyle(color: Color(0xff707070) ,
                                      fontSize: 12, fontFamily: Regular),),
                                  SizedBox(height: 3,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.directions_bike , size: 14  , color: MyColors.primaryColor,),
                                      Text( model.deliveryPrice == 'Free Delivery' ? '  Free Delivery' : r"  Rs  "+model.deliveryPrice, style: TextStyle(color: Color(0xff707070) ,
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
                SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
