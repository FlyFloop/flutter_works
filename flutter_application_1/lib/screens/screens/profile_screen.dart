import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/controller_consts.dart';
import 'package:photo_card_swiper/models/photo_card.dart';
import 'package:photo_card_swiper/photo_card_swiper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<PhotoCard> photo = [
    PhotoCard(
        cardId: '1',
        title: 'Card 1',
        description: 'Description 1',
        imagePath: 'https://picsum.photos/200',
        isLocalImage: false),
    PhotoCard(
        cardId: '2',
        title: 'Card 2',
        description: 'Description 2',
        imagePath: 'https://picsum.photos/200',
        isLocalImage: false),
    PhotoCard(
        cardId: '3',
        title: 'Card 3',
        description: 'Description 3',
        imagePath: 'https://picsum.photos/200',
        isLocalImage: false),
    PhotoCard(
        cardId: '4',
        title: 'Card 4',
        description: 'Description 4',
        imagePath: 'https://picsum.photos/200',
        isLocalImage: false),
    PhotoCard(
        cardId: '5',
        title: 'Card 5',
        description: 'Description 5',
        imagePath: 'https://picsum.photos/200',
        isLocalImage: false),
  ];
  void _leftButtonClicked() {
    print('Left button clicked');
  }

  void _centerButtonClicked() {
    print('Center button clicked');
  }

  void _rightButtonClicked() {
    print('Right button clicked');
  }

  void _cardSwiped(CardActionDirection _direction, int _index) {
    //This is just an example to show how one can load more cards.
    //you can skip using this method if you have predefined list of photos array.
    print(_direction);
    if (_direction == CardActionDirection.cardLeftAction) {
      print('sol');
    } else if (_direction == CardActionDirection.cardRightAction) {
      print('sağ');
    }
    if (_index == (photo.length - 1)) {}
  }

  @override
  void initState() {
    //get last location of user
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: PhotoCardSwiper(
                    photos: photo,
                    showLoading: true,
                    hideCenterButton: false,
                    leftButtonIcon: Icons.close,
                    rightButtonIcon: Icons.check,
                    centerButtonIcon: Icons.favorite,
                    leftButtonBackgroundColor: Colors.red[100],
                    rightButtonBackgroundColor: Colors.lightGreen[100],
                    centerButtonBackgroundColor: Colors.lightBlue[50],
                    leftButtonIconColor: Colors.red[600],
                    rightButtonIconColor: Colors.lightGreen[700],
                    centerButtonIconColor: Colors.lightBlue[600],
                    leftButtonAction: _leftButtonClicked,
                    rightButtonAction: _rightButtonClicked,
                    centerButtonAction: _centerButtonClicked,
                    onCardTap: () {
                      print('tap');
                    },
                    cardSwiped: _cardSwiped),
              ),
            ],
          ),
        ),
      ),
      // Text(firebaseAuth.currentUser!.uid),
    );
  }
}

/*
*/
