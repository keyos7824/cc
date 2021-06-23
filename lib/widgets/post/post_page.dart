import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import '../../models/post.dart';
import '../image/carousel.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key, required this.post}) : super(key: key);
  static const Widget padding = SizedBox(
    height: 20,
  );

  final Post post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        title: Text(
          post.username,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Carousel(images: post.imagesInts!),
              padding,
              Text(
                post.title,
                style: Theme.of(context).textTheme.headline2,
              ),
              padding,
              Text(
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
              padding,
              Text(
                post.body,
                style: Theme.of(context).textTheme.headline3,
              ),
              padding,
              Text(
                post.links,
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
