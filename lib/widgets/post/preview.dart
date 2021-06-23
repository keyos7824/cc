import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import '../../models/post.dart';
import '../image/carousel.dart';
import 'post_page.dart';

class PostPreview extends StatelessWidget {
  PostPreview({Key? key, required this.post}) : super(key: key);

  final Post post;

  static const Widget padding = SizedBox(
    height: 10,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => PostPage(post: post),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Carousel(
            images: post.imagesInts!,
          ),
          padding,
          Row(
            children: [],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  post.title,
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  post.username,
                  style: Theme.of(context).textTheme.headline3,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              formatDate(post.datePosted, [
                yyyy,
                '-',
                mm,
                '-',
                dd,
                ' à ',
                HH,
                ':',
                nn,
                ':',
                ss,
              ]),
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ],
      ),
    );
  }
}
