import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key, required this.appBar, this.isTrackButtonDisabled = false, this.isPlanButtonDisabled = false})
      : super(key: key);

  final AppBar appBar;
  final bool isTrackButtonDisabled;
  final bool isPlanButtonDisabled;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        TextButton(
            onPressed: () {
              !isPlanButtonDisabled
                  ? Navigator.popAndPushNamed(context, "/route1")
                  : null;
            },
            child: const Text(
              'Plan route',
              style: TextStyle(color: Colors.white),
            )),
        TextButton(
            onPressed: () {
              !isTrackButtonDisabled
                  ? Navigator.popAndPushNamed(context, "/track")
                  : null;
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
