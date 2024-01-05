import 'client.dart';

class BonDeReduction {
  String? id;
  String? dateDebut;
  String? dateFin;
  String? typeDeReduction;
  String? codeDeReduction;
  String? montantDeReduction;
  String? quantityBon;
  String? ageCible;
  String? sexeCible;
  String? localisation;
  String? image;
  List<Client>? views;
  List<Client>? likes;
  String? author;
  String? likeCount;
  String? viewCount;
  String? isLiked;
  String? isViewed;

  BonDeReduction({
    this.id,
    this.dateDebut,
    this.dateFin,
    this.typeDeReduction,
    this.codeDeReduction,
    this.montantDeReduction,
    this.quantityBon,
    this.ageCible,
    this.sexeCible,
    this.localisation,
    this.image,
    this.views,
    this.likes,
    this.author,
    this.likeCount,
    this.viewCount,
    this.isLiked,
    this.isViewed,
  });

  factory BonDeReduction.fromJson(Map<String, dynamic> json) => BonDeReduction(
        id: json['id'].toString(),
        dateDebut: json['dateDebut'].toString(),
        dateFin: json['dateFin'].toString(),
        typeDeReduction: json['typeDeReduction'].toString(),
        codeDeReduction: json['codeDeReduction'].toString(),
        montantDeReduction: json['montantDeReduction'].toString(),
        quantityBon: json['quantityBon'].toString(),
        ageCible: json['ageCible'].toString(),
        sexeCible: json['sexeCible'].toString(),
        localisation: json['localisation'].toString(),
        image: json['image'].toString(),
        views: null,
        likes: null,
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
        author: json['author'].toString(),
        likeCount: json['like_count'].toString(),
        viewCount: json['view_count'].toString(),
        isLiked: json['is_liked'].toString(),
        isViewed: json['is_viewed'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'dateDebut': dateDebut,
        'dateFin': dateFin,
        'typeDeReduction': typeDeReduction,
        'codeDeReduction': codeDeReduction,
        'montantDeReduction': montantDeReduction,
        'quantityBon': quantityBon,
        'ageCible': ageCible,
        'sexeCible': sexeCible,
        'localisation': localisation,
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
  set setTypeDeReduction(String typeDeReduction) => () {
        this.typeDeReduction = typeDeReduction;
      };
  get getTypeDeReduction => typeDeReduction;
  set setCodeDeReduction(String codeDeReduction) => () {
        this.codeDeReduction = codeDeReduction;
      };
  get getCodeDeReduction => codeDeReduction;
  set setMontantDeReduction(String montantDeReduction) => () {
        this.montantDeReduction = montantDeReduction;
      };
  get getMontantDeReduction => montantDeReduction;
  set setQuantityBon(String quantityBon) => () {
        this.quantityBon = quantityBon;
      };
  get getQuantityBon => quantityBon;
  set setAgeCible(String ageCible) => () {
        this.ageCible = ageCible;
      };
  get getAgeCible => ageCible;
  set setSexeCible(String sexeCible) => () {
        this.sexeCible = sexeCible;
      };
  get getSexeCible => sexeCible;
  set setLocalisation(String localisation) => () {
        this.localisation = localisation;
      };
  get getLocalisation => localisation;
  set setImage(String image) => () {
        this.image = image;
      };
  get getImage => image;
}
