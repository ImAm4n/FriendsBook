import 'package:flutter/material.dart';
import 'package:my_friend_list/list_view_detail_screen.dart';
import 'package:my_friend_list/list_view_screen.dart';
import 'package:my_friend_list/grid_view_screen.dart';
import 'package:my_friend_list/model/route_const.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final RouteConst routeConst = RouteConst();

  // This widget is the root of this application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friends List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        routeConst.initialRouteListScreen: (context) => const MyHomePage(),
        routeConst.listDetailScreen: (context) => const ProfileDetail(title: 'Profile Detail')
      },
      initialRoute: routeConst.initialRouteListScreen,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    MyFriendsListPage(title: 'Friends List'),
    const MyProfileImage(title: 'Profiles Grid')
  ];
  final List<Color> _backgroundColor = [
    Colors.amber.shade400,
    Colors.orange.shade400
  ];

  void _onBottomNavItemClick(int currentIndex) {
    setState(() {
      _selectedIndex = currentIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_photo_alternate_rounded),
            label: 'Pictures',
          ),
        ],
        backgroundColor: _backgroundColor.elementAt(_selectedIndex),
        elevation: 4.0,
        onTap: _onBottomNavItemClick,
        currentIndex: _selectedIndex,
        iconSize: 30.0,
        selectedItemColor: Colors.blue.shade900,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
