import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../utils/colors.dart';
import '../../view/pages/album_page.dart';

class Albums extends StatelessWidget {
  final List songsList;
  const Albums({Key? key, required this.songsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          children: List.generate(songsList.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 30),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          alignment: Alignment.bottomCenter,
                          child: AlbumPage(
                            song: songsList[index],
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
                              image: AssetImage(songsList[index]['img']),
                              fit: BoxFit.cover),
                          color: primary,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      songsList[index]['title'],
                      style: TextStyle(
                          fontSize: 15,
                          color: white,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 180,
                      child: Text(
                        songsList[index]['description'],
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
