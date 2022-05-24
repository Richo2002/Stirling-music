import 'package:flutter/material.dart';
import 'package:first/theme/colors.dart';

class MenuItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  final Color couleur;

  const MenuItem({Key? key, required this.icon, required this.title, required this.onTap, required this.couleur}) : super(key: key);

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Icon(
              widget.icon,
              color: white,
              size: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              widget.title,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20, color: widget.couleur,),
            )
          ],
        ),
      ),
    );
  }
}
