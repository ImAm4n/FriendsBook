import 'package:flutter/material.dart';
import 'package:my_friend_list/model/user.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        title: Text(title),
        leading: const BackButton(),
        elevation: 2.0,
        iconTheme: const IconThemeData(size: 30.0, color: Colors.white),
      ),
      body: Stack(
        children: [
          /*Container(
            margin: const EdgeInsets.only(top: 1.0, left: 1.0, right: 1.0),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 2.0,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(4.0)),
            width: double.infinity,
            height: 200,
            child: Image.network(args.urlCoverPic, fit: BoxFit.cover),
          ),*/
          const SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
          Card(
            elevation: 2.0,
            child: Image.network(
              args.urlCoverPic,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            left: 122.0,
            top: 110.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60.0,
                  backgroundImage: NetworkImage(args.urlAvatar),
                ),
                Text(
                  args.userName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Text(
                  args.email,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
