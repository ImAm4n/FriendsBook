import 'package:flutter/material.dart';
import 'package:my_friend_list/model/user.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;

    return WillPopScope(
      onWillPop: () async {
        return await Future.value(false); // To disable the system back button
      },
      child: Scaffold(
        appBar: AppBar(
          /*centerTitle: false,
          backgroundColor: Colors.blue.shade500,*/
          title: Text(title),
          leading: BackButton(
            onPressed: () {
              if (user.isAccepted != null && user.isAccepted == true) {
                Navigator.pop(context, true);
              } else if (user.isAccepted != null && user.isAccepted == false) {
                Navigator.pop(context, false);
              } else {
                Navigator.pop(context);
              }
            },
          ),
          elevation: 2.0,
          iconTheme: const IconThemeData(size: 30.0, color: Colors.white),
        ),
        body: Stack(
          children: [
            const SizedBox(
              width: double.infinity,
              height: double.infinity,
            ),
            Card(
              elevation: 2.0,
              child: Image.network(
                user.urlCoverPic,
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
                    backgroundImage: NetworkImage(user.urlAvatar),
                  ),
                  Text(
                    user.userName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Text(
                    user.email,
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
            Padding(
              padding: const EdgeInsets.only(top: 280.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    /*style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.green)),*/
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text('Accept'),
                  ),
                  ElevatedButton(
                    /*style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red)),*/
                    style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                      backgroundColor: const MaterialStatePropertyAll(Colors.red),
                    ),
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text('Reject'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 348.0),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomColumnText(
                      titleText: 'Rating',
                      valueText: user.rating,
                    ),
                    const VerticalDivider(
                      thickness: 1.4,
                      color: Colors.black54,
                      indent: 4.0,
                      endIndent: 4.0,
                    ),
                    CustomColumnText(
                      titleText: 'Following',
                      valueText: user.following,
                    ),
                    const VerticalDivider(
                      thickness: 1.4,
                      color: Colors.black54,
                      indent: 4.0,
                      endIndent: 4.0,
                    ),
                    CustomColumnText(
                      titleText: 'Followers',
                      valueText: user.followers,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 408.0),
              child: Container(
                margin: const EdgeInsets.only(left: 32.0, right: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      user.about,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomColumnText extends StatelessWidget {
  const CustomColumnText({
    super.key,
    required this.titleText,
    required this.valueText,
  });

  final String titleText;
  final String valueText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          valueText,
          style: const TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
        ),
        Text(
          titleText,
          style: const TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 13.0,
          ),
        ),
      ],
    );
  }
}
