import 'package:lycs_fid_customers/model/client.dart';

class Article {
  String? id;
  String? nomArticle;
  String? prix;
  String? description;
  String? ageCible;
  String? sexeCilbe;
  String? adresse;
  String? dateDebut;
  String? dateFin;
  String? image;
  String? localisation;
  List<Client>? views;
  List<Client>? likes;
  String? author;
  String? likeCount;
  String? viewCount;
  String? isLiked;
  String? isViewed;

  Article({
    this.id,
    this.nomArticle,
    this.prix,
    this.description,
    this.ageCible,
    this.sexeCilbe,
    this.adresse,
    this.dateDebut,
    this.dateFin,
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
      nomArticle: json['nomArticle'].toString(),
      prix: json['prix'].toString(),
      description: json['description'].toString(),
      ageCible: json['ageCible'].toString(),
      sexeCilbe: json['sexeCilbe'].toString(),
      adresse: json['adresse'].toString(),
      dateDebut: json['dateDebut'].toString(),
      dateFin: json['dateFin'].toString(),
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
        'nomArticle': nomArticle,
        'prix': prix,
        'description': description,
        'ageCible': ageCible,
        'sexeCilbe': sexeCilbe,
        'adresse': adresse,
        'dateDebut': dateDebut,
        'dateFin': dateFin,
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
  set setDateDebut(String dateDebut) => () {
        this.dateDebut = dateDebut;
      };
  get getDateDebut => dateDebut;
  set setDateFin(String dateFin) => () {
        this.dateFin = dateFin;
      };
  get getDateFin => dateFin;
  set setNomArticle(String nomArticle) => () {
        this.nomArticle = nomArticle;
      };
  get getNomArticle => nomArticle;
  set setDescription(String description) => () {
        this.description = description;
      };
  get getDescription => description;

  set setPrix(String prix) => () {
        this.prix = prix;
      };
  get getPrix => prix;
  set setImage(String image) => () {
        this.image = image;
      };
  get getImage => image;
}
