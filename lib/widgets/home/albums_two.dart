import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../data/songs.dart';
import '../../../../utils/colors.dart';
import '../../view/pages/album_page.dart';

class AlbumsTwo extends StatelessWidget {
  const AlbumsTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          children: List.generate(songs.length - 5, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 30),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          alignment: Alignment.bottomCenter,
                          child: AlbumPage(
                            song: songs[index + 5],
                          ),
                          type: PageTransitionType.scale));
                },
                child: Column(
                  children: [
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(songs[index + 5]['img']),
                              fit: BoxFit.cover),
                          color: primary,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      songs[index + 5]['title'],
                      style: TextStyle(
                          fontSize: 15,
                          color: white,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 180,
                      child: Text(
                        songs[index + 5]['description'],
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            color: grey,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}