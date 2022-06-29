import 'package:flutter/material.dart';

import '../../../../data/songs.dart';
import '../../../../utils/colors.dart';

class SongTypes extends StatelessWidget {
  final void Function(int index)? onTap;
  final int activeMenu;
  final List songType;
  const SongTypes({
    Key? key,
    this.onTap,
    required this.activeMenu,
    required this.songType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, top: 20),
        child: Row(
            children: List.generate(song_type_1.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 25),
            child: GestureDetector(
              onTap: () {
                onTap!(index);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    //song_type_1[index],
                    songType[index],
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
