import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Menu'),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          _listTile(context, Icons.person, 'User Profile'),
          const Divider(),
          _listTile(context, Icons.payment, 'User Card'),
          const Divider(),
          _listTile(context, Icons.category_rounded, 'Categories'),
          const Divider(),
          _listTile(context, Icons.view_headline_outlined, 'View Orders'),
          const Divider(),
          _listTile(context, Icons.mode_edit_outlined, 'Edit Your Products'),
          const Divider(),
          _listTile(context, Icons.exit_to_app, 'Logout'),
        ],
      ),
    );
  }

  ListTile _listTile(BuildContext context, IconData _icon, String _text) {
    return ListTile(
      leading: Icon(_icon),
      title: Text(_text),
      onTap: () {},
    );
  }
}
