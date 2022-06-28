import 'package:flutter/material.dart';

import '../../../../data/songs.dart';
import '../../../../utils/colors.dart';

class SongTypes extends StatefulWidget {
  const SongTypes({
    Key? key,
  }) : super(key: key);

  @override
  State<SongTypes> createState() => _SongTypesState();
}

class _SongTypesState extends State<SongTypes> {
  int activeMenu1 = 0;
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
                setState(() {
                  activeMenu1 = index;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song_type_1[index],
                    style: TextStyle(
                        fontSize: 15,
                        color: activeMenu1 == index ? primary : grey,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  activeMenu1 == index
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
