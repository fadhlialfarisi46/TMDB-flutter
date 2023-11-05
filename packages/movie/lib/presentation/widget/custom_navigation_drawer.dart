/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 4:27 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/4/23, 4:27 PM
 *
 */

import 'package:core/common/routes.dart';
import 'package:flutter/material.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/circle-g.png'),
            ),
            accountName: Text('Ditonton'),
            accountEmail: Text('ditonton@dicoding.com'),
          ),
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('Movies'),
            onTap: () {
              selectedItem(context, 0);
            },
          ),
          ListTile(
            leading: const Icon(Icons.save_alt),
            title: const Text('Watchlist Movie'),
            onTap: () {
              selectedItem(context, 1);
            },
          ),
          ListTile(
            leading: const Icon(Icons.tv),
            title: const Text('Tv Shows'),
            onTap: () {
              selectedItem(context, 2);
            },
          ),
          ListTile(
            leading: const Icon(Icons.system_update_tv_sharp),
            title: const Text('Watchlist TvShow'),
            onTap: () {
              selectedItem(context, 3);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            onTap: () {
              selectedItem(context, 4);
            },
          ),
        ],
      ),
    );
  }

  void selectedItem(BuildContext context, int index) {
    if (index != 0) {
      Navigator.of(context).pop();
    }

    switch (index) {
      case 0:
        Navigator.pop(context);
        break;
      case 1:
        Navigator.pushNamed(context, WATCHLIST_MOVIE_ROUTE);
        break;
      case 2:
        Navigator.pushNamed(context, TVSHOW_ROUTE);
        break;
      case 3:
        Navigator.pushNamed(context, WATCHLIST_TVSHOW_ROUTE);
        break;
      case 4:
        Navigator.pushNamed(context, ABOUT_ROUTE);
        break;
    }
  }
}
