

import 'package:instagram_clone/model/panda_pick_model/pandaPickItemModel.dart';

class PandaPickHelper {

  static var statusList = [
    PandaPickItemModel( name: 'New York Pizza', deliveryPrice: '90', remaingTime: '30 min', image: "https://images.pexels.com/photos/1435907/pexels-photo-1435907.jpeg?cs=srgb&dl=pexels-engin-akyurt-1435907.jpg&fm=jpg", ratting: '4.8', subTitle: 'New York', totalRating: '1.2k'),
    PandaPickItemModel( name: 'Burger Lab', deliveryPrice: '50', remaingTime: '25 min', image : "https://images.pexels.com/photos/2983101/pexels-photo-2983101.jpeg?cs=srgb&dl=pexels-jonathan-borba-2983101.jpg&fm=jpg", ratting: '4.2' , subTitle : 'Burgers', totalRating: '230'),
    PandaPickItemModel( name: 'Jans Delights', deliveryPrice: '600', remaingTime: '20 min', image : "https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg?cs=srgb&dl=pexels-robin-stickel-70497.jpg&fm=jpg", ratting: '2.5' , subTitle :"Pakistani", totalRating: '400'),

  ];

  static PandaPickItemModel getStatusItem(int position) {
    return statusList[position];
  }

  static var itemCount = statusList.length;

}