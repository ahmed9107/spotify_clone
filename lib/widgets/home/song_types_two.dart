import 'package:flutter/material.dart';

import '../../../../data/songs.dart';
import '../../../../utils/colors.dart';

class SongTypesTwo extends StatefulWidget {
  const SongTypesTwo({Key? key}) : super(key: key);

  @override
  State<SongTypesTwo> createState() => _SongTypesTwoState();
}

class _SongTypesTwoState extends State<SongTypesTwo> {
  int activeMenu = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, top: 20),
        child: Row(
            children: List.generate(song_type_2.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 25),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  activeMenu = index;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song_type_2[index],
                    style: TextStyle(
                        fontSize: 15,
                        color: activeMenu == index ? primary : grey,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  activeMenu == index
                      ? Container(
                          width: 10,
                          height: 3,
                          decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(5)),
                        )
                      : Container()
                ],
              ),
            ),
          );
        })),
      ),
    );
  }
}
