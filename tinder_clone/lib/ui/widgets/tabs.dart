import 'package:flutter/material.dart';
import 'package:tinder_clone/ui/constants.dart';
import 'package:tinder_clone/ui/matches.dart';
import 'package:tinder_clone/ui/messages.dart';
import 'package:tinder_clone/ui/searchs.dart';

class Tabs extends StatelessWidget {
  Tabs({Key? key}) : super(key: key);

  List<Widget> pages = [
    Searches(),
    Matches(),
    Messages(),
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: backgroundColor,
      ),
      child: DefaultTabController(
        length: pages.length,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Tinder Clone'),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app))
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48.0),
              child: Container(
                height: 48.0,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TabBar(
                      tabs: [
                        Tab(
                          icon: Icon(Icons.search),
                        ),
                        Tab(
                          icon: Icon(Icons.people),
                        ),
                        Tab(
                          icon: Icon(Icons.message),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: pages,
          ),
        ),
      ),
    );
  }
}
