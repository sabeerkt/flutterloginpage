import 'package:flutter/material.dart';
import 'package:login/screen/login.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 253, 253, 253),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 18, 193, 172),
          title: Text("-Home-"),
          actions: [
            IconButton(
              onPressed: () {
                signout(context);
              },
              icon: Icon(Icons.exit_to_app),
            ),
          ],
        ),
        body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("Person $index"),
              subtitle: Text("Message $index"),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://png.pngtree.com/thumb_back/fh260/background/20210331/pngtree-pink-marble-abstract-texture-mobile-phone-wallpaper-image_598365.jpg'),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: 101,
        ));
  }
}

signout(BuildContext ctx) {
  Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx) => ScreenLogin()), (route) => false);
}
