import 'package:lycs_fid_customers/model/client.dart';

class Campagne {
  String? id;
  String? nomCampagne;
  String? description;
  String? ageCible;
  String? sexeCilbe;
  String? adresse;
  String? dateDebut;
  String? dateFin;
  String? image;
  List<Client>? views;
  List<Client>? likes;
  String? author;
  String? likeCount;
  String? viewCount;
  String? isLiked;
  String? isViewed;
  String? codePromo;

  Campagne(
      {this.id,
      this.nomCampagne,
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
      this.codePromo});

  factory Campagne.fromJson(Map<String, dynamic> json) => Campagne(
        id: json['id'].toString(),
        nomCampagne: json['nomCampagne'].toString(),
        description: json['description'].toString(),
        ageCible: json['ageCible'].toString(),
        sexeCilbe: json['sexeCilbe'].toString(),
        adresse: json['adresse'].toString(),
        dateDebut: json['dateDebut'].toString(),
        dateFin: json['dateFin'].toString(),
        image: json['image'].toString(),
        views: null,
        likes: null,
        author: json['author'].toString(),
        /*
      views: json['views'] != null
          ? (json['views'] as List)
              .map((dynamic i) => Client.fromJson(jsonDecode(i)))
              .toList()
          : null,
      likes: json['likes'] != null
          ? (json['likes'] as List)
              .map((dynamic i) => Client.fromJson(jsonDecode(i)))
              .toList()
          : null,
          */
        likeCount: json['like_count'].toString(),
        viewCount: json['view_count'].toString(),
        isLiked: json['is_liked'].toString(),
        isViewed: json['is_viewed'].toString(),
        codePromo: json['codePromo'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nomCampagne': nomCampagne,
        'description': description,
        'ageCible': ageCible,
        'sexeCilbe': sexeCilbe,
        'adresse': adresse,
        'dateDebut': dateDebut,
        'dateFin': dateFin,
        'image': image,
        //'views': views,
        //'likes': likes,
        'like_count': likeCount,
        'view_count': viewCount,
        'is_liked': isLiked,
        'is_viewed': isViewed,
        'codePromo': codePromo,
      };

  set setId(String id) => () {
        this.id = id;
      };
  get getId => id;
  set setNomCampagne(String nomCampagne) => () {
        this.nomCampagne = nomCampagne;
      };
  get getNomCampagne => nomCampagne;
  set setDescription(String description) => () {
        this.description = description;
      };
  get getDescription => description;
  set setAgeCible(String ageCible) => () {
        this.ageCible = ageCible;
      };
  get getAgeCible => ageCible;
  set setSexeCilbe(String sexeCilbe) => () {
        this.sexeCilbe = sexeCilbe;
      };
  get getSexeCilbe => sexeCilbe;
  set setAdresse(String adresse) => () {
        this.adresse = adresse;
      };
  get getAdresse => adresse;
  set setDateDebut(String dateDebut) => () {
        this.dateDebut = dateDebut;
      };
  get getDateDebut => dateDebut;
  set setDateFin(String dateFin) => () {
        this.dateFin = dateFin;
      };
  get getDateFin => dateFin;
  set setImage(String image) => () {
        this.image = image;
      };
  get getImage => image;
  set setViews(List<Client> views) => () {
        this.views = views;
      };
  get getViews => views;
  set setLikes(List<Client> likes) => () {
        this.likes = likes;
      };
  get getLikes => likes;
  set setLikeCount(String likeCount) => () {
        this.likeCount = likeCount;
      };
  get getLikeCount => likeCount;
  set setViewCount(String viewCount) => () {
        this.viewCount = viewCount;
      };
  get getViewCount => viewCount;
  set setIsLiked(String isLiked) => () {
        this.isLiked = isLiked;
      };
  get getIsLiked => isLiked;
  set setIsViewed(String isViewed) => () {
        this.isViewed = isViewed;
      };
  get getIsViewed => isViewed;
}
