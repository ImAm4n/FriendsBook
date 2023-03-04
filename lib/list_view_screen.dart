import 'package:flutter/material.dart';
import 'package:my_friend_list/model/route_const.dart';
import 'model/user.dart';

class MyFriendsListPage extends StatelessWidget {
  MyFriendsListPage({super.key, required this.title});

  final String title;
  final UserList userList = UserList();
  final RouteConst routeConst = RouteConst();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        title: Text(title),
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
                  trailing: const Icon(Icons.navigate_next),
                  onTap: () {
                    // To show the snackBar
                    /*ScaffoldMessenger.of(context).showSnackBar(
                      ShowSnackBar(
                        content: Text('Hello ${user.userName}!'),
                      ).showSnackBar(),
                    );*/

                    // To navigate to the detail screen
                    Navigator.pushNamed(
                      context,
                      routeConst.listDetailScreen,
                      arguments: user,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
