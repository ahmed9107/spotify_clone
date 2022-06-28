import 'package:flutter/material.dart';
import 'package:spotify_clone/utils/colors.dart';
import 'package:spotify_clone/widgets/home/albums.dart';
import 'package:spotify_clone/widgets/home/albums_two.dart';
import 'package:spotify_clone/widgets/home/song_types.dart';
import 'package:spotify_clone/widgets/home/song_types_two.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              children: const [
                SongTypes(),
                SizedBox(height: 20),
                Albums(),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SongTypesTwo(),
                SizedBox(height: 20),
                AlbumsTwo(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
