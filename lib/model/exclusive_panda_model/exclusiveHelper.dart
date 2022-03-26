


import 'package:instagram_clone/model/exclusive_panda_model/exclusive_item_model.dart';

class ExclusiveHelper {

  static var exclusiveListModel = [
    ExclusiveItemModel( name: 'Burning Brownies', deliveryPrice: 'Free Delivery', remaingTime: '15 min', image: "https://images.pexels.com/photos/1291712/pexels-photo-1291712.jpeg?cs=srgb&dl=pexels-matheus-guimarães-1291712.jpg&fm=jpg", totalRating: '300', subTitle: 'Backery' , rating: '4.3'),
    ExclusiveItemModel( name: 'OPTP G11', deliveryPrice: '50', remaingTime: '35 min', image : "https://images.pexels.com/photos/2271107/pexels-photo-2271107.jpeg?cs=srgb&dl=pexels-engin-akyurt-2271107.jpg&fm=jpg", totalRating: '400' , subTitle : 'Burgers' , rating: '4.7'),
    ExclusiveItemModel( name: 'China Town', deliveryPrice: '600', remaingTime: '20 min', image : "https://images.pexels.com/photos/2347311/pexels-photo-2347311.jpeg?cs=srgb&dl=pexels-engin-akyurt-2347311.jpg&fm=jpg", totalRating: '560' , subTitle :"Chinees" , rating:'2.3'),

  ];

  static ExclusiveItemModel getStatusItem(int position) {
    return exclusiveListModel[position];
  }

  static var itemCount = exclusiveListModel.length;

}