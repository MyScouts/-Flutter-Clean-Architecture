import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/account/account_screen.dart';
import 'package:flutter_demo/presentation/home/home_screen.dart';

class Tabbar extends StatelessWidget {
  const Tabbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.location_on)),
              Tab(icon: Icon(Icons.account_circle_rounded)),
            ],
          ),
          title: const Text('Home Screen'),
        ),
        body: TabBarView(
          children: [
            const HomeScreen(),
            const Icon(Icons.directions_transit),
            AccountScreen(),
          ],
        ),
      ),
    );
  }
}
