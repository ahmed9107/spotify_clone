import 'package:flutter/material.dart';
import 'package:spotify_clone/utils/colors.dart';

class BottomNavBar extends StatelessWidget {
  final List<Widget> children;
  const BottomNavBar({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(color: black),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children),
      ),
    );
  }
}
