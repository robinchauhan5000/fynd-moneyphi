import 'package:flutter/material.dart';

class AppBarWithBackButton extends StatelessWidget with PreferredSizeWidget {
  const AppBarWithBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: BackButton(
        color: Theme.of(context).textTheme.headline3?.color,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
