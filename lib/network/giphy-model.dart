
import 'dart:convert';
class GiphyModel {
  List<Giphy>? giphy;

  GiphyModel({this.giphy});

  GiphyModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      giphy = <Giphy>[];
      json['data'].forEach((v) {
        giphy!.add(new Giphy.fromJson(v));
      });
    } else{
      print('ini null');
    }
  }

}

class Giphy {
  final int? length;
  final String? title;
  final String? rating;
  final String? username;
  final Images? image;
  // final User? user;

  Giphy({this.length, this.title, this.rating, this.username, this.image});

   factory Giphy.fromJson(Map<String, dynamic> json) {
    return Giphy(
      title: json['title'],
      rating: json['rating'],
      username: json['username'],
      image: Images.fromJson(json['images']),
      // user: User.fromJson(json['user'] ?? 0)
    );
  }

}

class Images {
  final FixedWidth? fixed;

  Images({this.fixed});

  factory Images.fromJson(Map<String, dynamic> json) {
    return new Images(
      fixed: FixedWidth.fromJson(json['fixed_width'])
    );
   }
}

class FixedWidth {
  final String? url;

  FixedWidth({
    this.url,
  });

  factory FixedWidth.fromJson(Map<String, dynamic> json) {
    return new FixedWidth(
      url: json['url']
    );
  }
}

class User {
  final String? avatar;
  final String? username;
  final String? display;

  User({
    this.avatar,
    this.username,
    this.display
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return new User(
        avatar: json['avatar_url'],
        username: json['username'],
        display: json['display_name']
    );
  }

}