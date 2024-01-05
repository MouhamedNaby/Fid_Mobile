import 'package:lycs_fid_customers/model/client.dart';

class Article {
  String? id;
  String? ageCible;
  String? sexeCilbe;
  String? image;
  List<Client>? views;
  List<Client>? likes;
  String? author;
  String? likeCount;
  String? viewCount;
  String? isLiked;
  String? isViewed;

  Article({
    this.id,
    this.ageCible,
    this.sexeCilbe,
    this.image,
    this.views,
    this.likes,
    this.author,
    this.likeCount,
    this.viewCount,
    this.isLiked,
    this.isViewed,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'].toString(),
      ageCible: json['ageCible'].toString(),
      sexeCilbe: json['sexeCilbe'].toString(),
      image: json['image'].toString(),
      views: null,
      likes: null,
      /*
      views: json['views'] != null
          ? (json['views'] as List)
              .map((dynamic i) => Client.fromJson(jsonDecode(i)))
              .toList()
          : null,
      likes: json['views'] != null
          ? (json['views'] as List)
              .map((dynamic i) => Client.fromJson(jsonDecode(i)))
              .toList()
          : null,*/
      author: json['author'].toString(),
      likeCount: json['likeCount'].toString(),
      viewCount: json['viewCount'].toString(),
      isLiked: json['isLiked'].toString(),
      isViewed: json['isViewed'].toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'ageCible': ageCible,
        'sexeCilbe': sexeCilbe,
        'image': image,
        'views': views,
        'likes': likes,
        'author': author,
        'like_count': likeCount,
        'view_count': viewCount,
        'is_liked': isLiked,
        'is_viewed': isViewed,
      };

  set setId(String id) => () {
        this.id = id;
      };
  get getId => id;

  get getImage => image;
}
