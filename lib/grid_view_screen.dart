import 'package:flutter/material.dart';
import 'package:my_friend_list/show_snack_bar.dart';
import 'model/user.dart';

class MyProfileImage extends StatefulWidget {
  const MyProfileImage({super.key, required this.title});

  final String title;

  @override
  State<MyProfileImage> createState() => _MyProfileImageState();
}

class _MyProfileImageState extends State<MyProfileImage> {
  final UserList userList = UserList();

  void _onFavIconClick(int index) {
    setState(() {
      userList.users[index].isFavIconClicked =
          !userList.users[index].isFavIconClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade500,
        title: Text(widget.title),
        leading: const Icon(Icons.add_photo_alternate_rounded),
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
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: userList.users.length,
            itemBuilder: (context, index) {
              final User user = userList.users.elementAt(index);
              return Stack(
                children: [
                  Card(
                    elevation: 4.0,
                    color: Colors.white,
                    child: Image.network(
                      user.urlCoverPic,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  Positioned(
                    left: 150.0,
                    top: 8.0,
                    child: GestureDetector(
                      onTap: () {
                        _onFavIconClick(index);
                      },
                      child: Icon(
                        user.isFavIconClicked ? Icons.favorite : Icons.favorite_border,
                        size: 34.0,
                        color: user.isFavIconClicked ? Colors.red : Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100.0,
                    child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          ShowSnackBar(
                            content: Text('Hello ${user.userName}!'),
                          ).showSnackBar(),
                        );
                      },
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage(user.urlAvatar),
                      ),
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
