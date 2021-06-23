import 'dart:typed_data';

import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  final List<Uint8List> images;
  final Function(int index)? onChanged;

  Carousel({
    Key? key,
    required this.images,
    this.onChanged,
  }) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int currentIndex = 0;

  List<bool> get itemStates {
    List<bool> bools = [];

    for (int i = 0; i < widget.images.length; i++) {
      bools.add(i == currentIndex ? true : false);
    }

    return bools;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 225,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: widget.images.length,
            pageSnapping: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return Image.memory(
                widget.images[index],
                width: width,
                fit: BoxFit.cover,
              );
            },
          ),
          Positioned(
            bottom: 15,
            left: 5,
            child: Row(
              children: itemStates.map(
                (bool isAlive) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: 6.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                        color: isAlive ? Colors.black : Colors.grey,
                        shape: BoxShape.circle),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
