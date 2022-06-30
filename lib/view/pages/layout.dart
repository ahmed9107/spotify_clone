import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/utils/colors.dart';

import '../../provider/provider.dart';
import '../widgets/layout/bottom_nav_bar.dart';
import 'home_page.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Model(),
      child: Scaffold(
        backgroundColor: black,
        body: Consumer<Model>(builder: (context, model, child) {
          return IndexedStack(
            index: model.activeTab,
            children: [
              const HomePage(),
              Center(
                child: Text(
                  "Search",
                  style: TextStyle(
                      fontSize: 20, color: white, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  "Library",
                  style: TextStyle(
                      fontSize: 20, color: white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        }),
        bottomNavigationBar: Consumer<Model>(builder: (context, model, child) {
          return BottomNavBar(
              children: List.generate(model.bottomNavBaritems.length, (index) {
            return IconButton(
                icon: Icon(model.bottomNavBaritems[index],
                    color: model.activeTab == index ? white : grey),
                onPressed: () {
                  model.changeBottomNavBarIndex(index);
                });
          }));
        }),
      ),
    );
  }
}
