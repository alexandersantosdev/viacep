import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function func;

  const MenuItem({super.key, required this.icon, required this.title, required this.func});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        onTap: () => func(),
        leading: Icon(icon),
        title: Text(title),
      ),
    );
  }
}