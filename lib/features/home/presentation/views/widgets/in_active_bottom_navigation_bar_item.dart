import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class InActiveBottomNavigationBarItem extends StatelessWidget {
  const InActiveBottomNavigationBarItem({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Expanded(flex: 2, child: SvgPicture.asset(image));
  }
}
