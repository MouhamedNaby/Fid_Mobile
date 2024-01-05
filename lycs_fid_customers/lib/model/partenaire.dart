class Partenaire {
  String id;
  String lastName;
  String firstName;
  String email;
  String adresse;
  String phone;
  String name;
  String groupe;
  String sousGroupe;
  String ninea;

  Partenaire(
      {this.id = '',
      this.lastName = '',
      this.firstName = '',
      this.email = '',
      this.adresse = '',
      this.phone = '',
      this.name = '',
      this.groupe = '',
      this.sousGroupe = '',
      this.ninea = ''});

  set setId(String id) => () {
        this.id = id;
      };

  String get getId => id;
  set setLastName(String lastName) => () {
        this.lastName = lastName;
      };
  String get getLastName => lastName;
  set setFirstName(String firstName) => () {
        this.firstName = firstName;
      };
  String get getFirstName => firstName;
  set setEmail(String email) => () {
        this.email = email;
      };
  String get getEmail => email;
  set setAdresse(String adresse) => () {
        this.adresse = adresse;
      };
  String get getAdresse => adresse;
  set setPhone(String phone) => () {
        this.phone = phone;
      };
  String get getPhone => phone;
  set setName(String name) => () {
        this.name = name;
      };
  String get getName => name;
  set setGroupe(String groupe) => () {
        this.groupe = groupe;
      };
  String get getGroupe => groupe;
  set setSousGroupe(String sousGroupe) => () {
        this.sousGroupe = sousGroupe;
      };
  String get getSousGroupe => sousGroupe;
  set setNinea(String ninea) => () {
        this.ninea = ninea;
      };
  String get getNinea => ninea;

  factory Partenaire.fromJson(Map<String, dynamic> json) => Partenaire(
      id: json['id'].toString(),
      lastName: json['lastName'].toString(),
      firstName: json['firstName'].toString(),
      email: json['email'].toString(),
      adresse: json['adresse'].toString(),
      phone: json['phone'].toString(),
      name: json['name'].toString(),
      groupe: json['groupe'].toString(),
      sousGroupe: json['sousGroupe'].toString(),
      ninea: json['ninea'].toString());

  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'email': email,
        'adresse': adresse,
        'phone': phone,
        'name': name,
        'groupe': groupe,
        'sousGroupe': sousGroupe,
        'ninea': ninea
      };
}
