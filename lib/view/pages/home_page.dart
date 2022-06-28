import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/data/songs.dart';
import 'package:spotify_clone/utils/colors.dart';
import 'package:spotify_clone/widgets/home/albums.dart';
import 'package:spotify_clone/widgets/home/song_types.dart';
import '../../provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Model(),
      child: Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          backgroundColor: black,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Explore",
                  style: TextStyle(
                      fontSize: 20, color: white, fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.list)
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<Model>(builder: (context, model, child) {
                    return SongTypes(
                      onTap: (index) {
                        model.changeActiveMenuOne(index);
                      },
                      activeMenu: model.activeMenu1,
                      songType: song_type_1,
                    );
                  }),
                  const SizedBox(height: 20),
                  Albums(
                    songsList: songs.sublist(0, 5),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<Model>(builder: (context, model, child) {
                    return SongTypes(
                      onTap: (index) {
                        model.changeActiveMenuTwo(index);
                      },
                      activeMenu: model.activeMenu2,
                      songType: song_type_2,
                    );
                  }),
                  const SizedBox(height: 20),
                  Albums(
                    songsList: songs.sublist(5),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
