import 'dart:convert';
import 'dart:typed_data';

class Post {
  late final List<Uint8List>? imagesInts;
  final String body;
  final String title;
  final DateTime datePosted;
  final String links;
  final String username;

  Post({
    this.imagesInts,
    required this.body,
    required this.title,
    required this.datePosted,
    required this.links,
    required this.username,
  });

  factory Post.fromJson(Map jsonBody) {
    return Post(
      body: jsonBody["body"],
      title: jsonBody["title"],
      datePosted: DateTime.parse(jsonBody["datePosted"]),
      links: "whatever",
      username: jsonBody["username"],
      imagesInts: _convertImages(jsonBody["images"],),
    );
  }

  static List<Uint8List> _convertImages(List imagesAsStrings) {
    List<Uint8List> convertedImages = [];
    for (var image in imagesAsStrings) {
      image = image.toString();
      convertedImages.add(
          base64Decode(image),
      );
    }

    return convertedImages;
  }
}