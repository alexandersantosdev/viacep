import 'package:flutter/material.dart';
import 'package:viacep/shared/constants.dart';
import 'package:viacep/shared/menu_item.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
              accountName: Text("Alexander Roberto dos Santos"),
              accountEmail: Text("lekxandy@gmail.com"),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://github.com/alexandersantosdev.png"))),
          Expanded(
            child: ListView(
              children: Constants.menuItems
                  .map(
                    (menuItem) => MenuItem(
                      icon: menuItem["icon"],
                      title: menuItem["title"],
                      func: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => menuItem["route"],
                          ),
                        );
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
