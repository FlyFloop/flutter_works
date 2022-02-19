import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_get_x_work/constants.dart';
import 'package:flutter_get_x_work/graph_screen.dart';
import 'package:flutter_get_x_work/history_screen.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _bottomNavigationBarActiveIndex = 0;
  Widget currentScreen = graph_screen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text(homeappBarTitle), ),
      body: currentScreen,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.grey,
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [
          Icons.show_chart,
          Icons.history,
        ],
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        activeIndex: _bottomNavigationBarActiveIndex,
        gapLocation: GapLocation.center,
        iconSize: 30,
        backgroundColor: Colors.grey,
        onTap: (index) {
          //sayfa seçimine göre bodyi değiştiriyor
          switch (index) {
            case 0:
              // Get.to(graph_screen());
              setState(() {
                currentScreen = graph_screen();
              });
              break;
            case 1:
              // Get.to(history_screen());
              setState(() {
                currentScreen = history_screen();
              });
              break;
            default:
              throw (bottomNavagationBarThrow);
          }
        },
      ),
    );
  }
}
