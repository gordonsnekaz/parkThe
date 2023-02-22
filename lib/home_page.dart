import 'package:flutter/material.dart';
import 'package:parkthe/landing_page.dart';
import 'package:parkthe/my_bills_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<HomePage> createState() => _HomePageState(username);
}

class _HomePageState extends State<HomePage> {
  String uname = '';

  _HomePageState(String username) {
    uname = username;
  }

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  //Bottom navigation screens
  List<Widget> _buildScreens() {
    return [
      const LandingPage(),
      const MyBillsPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.directions_car_outlined),
        title: ("Parking"),
        activeColorPrimary: const Color(0xff51A71D),
        inactiveColorPrimary: const Color(0xff828282),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.payment_outlined),
        title: ("My Bills"),
        activeColorPrimary: const Color(0xff51A71D),
        inactiveColorPrimary: const Color(0xff828282),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: const Color(0xff1F1F1F),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: const NavBarDecoration(
        colorBehindNavBar: Color(0xff1F1F1F),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 400),
      ),
      navBarHeight: 90,
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
