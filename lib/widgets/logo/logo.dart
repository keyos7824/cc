import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            'assets/outer.svg',
            height: 40,
          ),
          SvgPicture.asset(
            'assets/inner.svg',
            height: 30,
          ),
          SvgPicture.asset(
            'assets/center.svg',
            height: 6,
          ),
        ],
      ),
    );
  }
}