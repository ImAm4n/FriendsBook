import 'package:flutter/material.dart';
import 'package:my_friend_list/model/route_const.dart';
import 'model/user.dart';

class MyFriendsListPage extends StatefulWidget {
  const MyFriendsListPage({super.key, required this.title});

  final String title;

  @override
  State<MyFriendsListPage> createState() => _MyFriendsListPageState();
}

class _MyFriendsListPageState extends State<MyFriendsListPage> {
  final UserList userList = UserList();
  final RouteConst routeConst = RouteConst();
  Color iconColor = Colors.white;

  Future<void> _navigate(BuildContext context, User user, int index) async {
    final bool? isAccepted = await Navigator.pushNamed(
      context,
      routeConst.listDetailScreen,
      arguments: user,
    ) as bool?;

    if (!mounted) return;

    _onCardClick(isAccepted, index);
  }

  void _onCardClick(bool? isAccepted, int index) {
    setState(() {
      userList.users[index].isAccepted = isAccepted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        title: Text(widget.title),
        leading: const Icon(Icons.account_circle),
        elevation: 4.0,
        iconTheme: const IconThemeData(size: 30.0, color: Colors.white),
      ),
      body: Stack(
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1522441815192-d9f04eb0615c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Y29sb3IlMjBiYWNrZ3JvdW5kfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          ListView.builder(
            itemCount: userList.users.length,
            itemBuilder: (BuildContext context, int index) {
              final User user = userList.users.elementAt(index);
              return Card(
                margin: const EdgeInsets.all(4.0),
                elevation: 4.0,
                color: Colors.white,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(user.urlAvatar),
                  ),
                  title: Text(user.userName),
                  subtitle: Text(user.email),
                  trailing: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 32.0,
                    children: [
                      _requestIcon(user),
                      const Icon(Icons.navigate_next, size: 28.0)
                    ],
                  ),
                  onTap: () {
                    // To show the snackBar
                    /*ScaffoldMessenger.of(context).showSnackBar(
                      ShowSnackBar(
                        content: Text('Hello ${user.userName}!'),
                      ).showSnackBar(),
                    );*/

                    // To navigate to the detail screen
                    /*Navigator.pushNamed(
                      context,
                      routeConst.listDetailScreen,
                      arguments: user,
                    );*/

                    //To navigate and get back the data
                    _navigate(context, user, index);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Icon _requestIcon(User user) {
    Icon acceptedIcon = const Icon(null);

    if (user.isAccepted != null && user.isAccepted == true) {
      acceptedIcon = const Icon(
        Icons.check_circle,
        color: Colors.green,
        size: 24.0,
      );
    } else if (user.isAccepted != null && user.isAccepted == false) {
      acceptedIcon = const Icon(
        Icons.cancel,
        color: Colors.red,
        size: 24.0,
      );
    }

    return acceptedIcon;
  }
}
