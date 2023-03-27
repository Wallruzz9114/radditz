import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:radditz/src/constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static MaterialPageRoute<HomeScreen> route() => MaterialPageRoute<HomeScreen>(
        builder: (BuildContext context) => const HomeScreen(),
      );

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AppBar appBar = UIConstants.appBar();
  int _currentScreenIndex = 0;

  List<BottomNavigationBarItem> getTabItems() => <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            _currentScreenIndex == 0
                ? AssetConstants.homeFilledIcon
                : AssetConstants.homeOutlinedIcon,
            color: PalleteConstants.whiteColor,
          ),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AssetConstants.searchIcon,
            color: PalleteConstants.whiteColor,
          ),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            _currentScreenIndex == 2
                ? AssetConstants.notifFilledIcon
                : AssetConstants.notifOutlinedIcon,
            color: PalleteConstants.whiteColor,
          ),
        ),
      ];

  void changeScreen(int index) {
    setState(() {
      _currentScreenIndex = index;
    });
  }

  @override
  Scaffold build(BuildContext context) => Scaffold(
        appBar: appBar,
        body: IndexedStack(
          index: _currentScreenIndex,
          children: const <Widget>[
            Text('Feed Screen'),
            Text('Search Screen'),
            Text('Notifications Screen'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: PalleteConstants.whiteColor,
            size: 28,
          ),
        ),
        bottomNavigationBar: Platform.isIOS
            ? CupertinoTabBar(
                currentIndex: _currentScreenIndex,
                onTap: changeScreen,
                items: getTabItems(),
                backgroundColor: PalleteConstants.backgroundColor,
              )
            : BottomNavigationBar(
                currentIndex: _currentScreenIndex,
                onTap: changeScreen,
                items: getTabItems(),
                backgroundColor: PalleteConstants.backgroundColor,
              ),
      );
}
