import 'package:flutter/material.dart';
import 'package:my_friend_list/list_view_detail_screen.dart';
import 'package:my_friend_list/list_view_screen.dart';
import 'package:my_friend_list/grid_view_screen.dart';
import 'package:my_friend_list/model/route_const.dart';
import 'package:my_friend_list/style/style_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final RouteConst routeConst = RouteConst();

  // This widget is the root of this application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friends List App',
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headlineMedium: StyleHelper.headerTextStyle,
        ),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        elevatedButtonTheme: const ElevatedButtonThemeData(
            style: ButtonStyle(
                elevation: MaterialStatePropertyAll(6.0),
                backgroundColor: MaterialStatePropertyAll(Colors.orange),
                textStyle: MaterialStatePropertyAll(TextStyle(
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                ))
            )
        ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headlineMedium: StyleHelper.headerTextStyle,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        elevatedButtonTheme: const ElevatedButtonThemeData(
         style: ButtonStyle(
           elevation: MaterialStatePropertyAll(6.0),
           backgroundColor: MaterialStatePropertyAll(Colors.orange),
           textStyle: MaterialStatePropertyAll(TextStyle(
             fontSize: 20.0,
             fontStyle: FontStyle.italic,
           ))
         )
        ),
      ),
      routes: {
        routeConst.initialRouteListScreen: (context) => const MyHomePage(),
        routeConst.listDetailScreen: (context) =>
            const ProfileDetail(title: 'Profile Detail')
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
    const MyFriendsListPage(title: 'Friends List'),
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
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex > 0) {
          _onBottomNavItemClick(0);
          return await Future.value(false);
        } else {
          return await Future.value(true);
        }
      },
      child: Scaffold(
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
      ),
    );
  }
}
