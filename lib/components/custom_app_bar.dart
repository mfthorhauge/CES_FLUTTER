import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.appBar}) : super(key: key);

  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        TextButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/route1");
            },
            child: const Text(
              'Plan route',
              style: TextStyle(color: Colors.white),
            )),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Track Parcel',
              style: TextStyle(color: Colors.white),
            )),
      ],
      centerTitle: false,
      title: Image.asset(
        "assets/images/telstar.jpg",
        fit: BoxFit.contain,
        height: 40,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
