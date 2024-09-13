import 'package:flutter/material.dart';

class ListTileItem extends StatelessWidget {
  final String title;
  final Widget tileIcon;
  final void Function()? onTap;
  const ListTileItem({
    super.key,
    required this.title,
    required this.tileIcon,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: ListTile(
            leading: tileIcon,
            title: Text(
              title,
              style: const TextStyle(
                  fontSize: 20, fontFamily: "main_font", letterSpacing: 1),
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
        ),
        Divider(
          height: 10,
          thickness: 1,
          color: Colors.grey[300],
        )
      ],
    );
  }
}
