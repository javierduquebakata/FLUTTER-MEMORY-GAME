import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';



class CardData{
  late int id;
  late String img;
  late GlobalKey<FlipCardState> state;

  CardData({required this.id, required this.img}){
    state = GlobalKey<FlipCardState>();
  }
}

// class CoupleCards{
//
//   late List<Card> couple;
//
//   CoupleCards(int id, String img_1, String img_2){
//     couple = [
//       Card(id: id, img : img_1),
//       Card(id: id, img : img_2),
//     ];
//   }
// }



class DeckController {
  static List<CardData> source = [
    CardData( id: 0,  img: 'assets/images/image_1_1.png', ),
    CardData( id: 0,  img: 'assets/images/image_1_2.png', ),
    CardData( id: 1,  img: 'assets/images/image_2_1.png',),
    CardData( id: 1,  img: 'assets/images/image_2_2.png',),
    CardData( id: 2,  img: 'assets/images/image_3_1.png',),
    CardData( id: 2,  img: 'assets/images/image_3_2.png',),
    CardData( id: 3,  img: 'assets/images/image_4_1.png',),
    CardData( id: 3,  img: 'assets/images/image_4_2.png',),
    CardData( id: 4,  img: 'assets/images/image_5_1.png',),
    CardData( id: 4,  img: 'assets/images/image_5_2.png',),
    CardData( id: 5,  img: 'assets/images/image_6_1.png',),
    CardData( id: 5,  img: 'assets/images/image_6_2.png',),
    CardData( id: 6,  img: 'assets/images/image_7_1.png',),
    CardData( id: 6,  img: 'assets/images/image_7_2.png',),
    CardData( id: 7,  img: 'assets/images/image_8_1.png',),
    CardData( id: 7,  img: 'assets/images/image_8_2.png',),
    CardData( id: 8,  img: 'assets/images/image_9_1.png',),
    CardData( id: 8,  img: 'assets/images/image_9_2.png',),
    CardData( id: 9,  img: 'assets/images/image_10_1.png',),
    CardData( id: 9,  img: 'assets/images/image_10_2.png',),
  ];


  static List<CardData> shuffle(){
    return List.from(DeckController.source)..shuffle();
  }

  static List<bool> initialGameState() {
    return List.filled(source.length, true);
  }

}

 // List<String> imageSource = [
 //
 //    'assets/images/old_image_2.png',
 //    'assets/images/old_image_3.png',
 //    'assets/images/old_image_4.png',
 //    'assets/images/old_image_5.png',
 //    'assets/images/old_image_6.png',
 //    'assets/images/old_image_7.png',
 //    'assets/images/old_image_8.png',
 //    'assets/images/image_9_1.png',
 //    'assets/images/old_image_1.png',
 //    'assets/images/old_image_2.png',
 //    'assets/images/old_image_3.png',
 //    'assets/images/old_image_4.png',
 //    'assets/images/old_image_5.png',
 //    'assets/images/old_image_6.png',
 //    'assets/images/old_image_7.png',
 //    'assets/images/old_image_8.png',
 //    'assets/images/image_9_2.png',
 //  ];

// List createShuffledListFromImageSource() {
//   List shuffledImages = [];
//   List sourceArray = imageSource;
//   for (var element in sourceArray) {
//     shuffledImages.add(element);
//   }
//   shuffledImages.shuffle();
//   return shuffledImages;
// }
//
// List<bool> getInitialItemStateList() {
//   List<bool> initialItem = <bool>[];
//   for (int i = 0; i < imageSource.length; i++) {
//     initialItem.add(true);
//   }
//   return initialItem;
// }
//
// List<GlobalKey<FlipCardState>> createFlipCardStateKeysList() {
//   List<GlobalKey<FlipCardState>> cardStateKeys = <GlobalKey<FlipCardState>>[];
//   for (int i = 0; i < imageSource.length; i++) {
//     cardStateKeys.add(GlobalKey<FlipCardState>());
//   }
//   return cardStateKeys;
// }
