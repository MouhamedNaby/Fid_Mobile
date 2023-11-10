class Client {
  String id;
  String nom;
  String prenom;
  String email;
  String password;
  String tel;

  Client(
      {required this.id,
      required this.nom,
      required this.prenom,
      required this.email,
      required this.password,
      required this.tel});

  factory Client.fromJson(Map<String, dynamic> json) => Client(
      id: json['id'],
      nom: json['nom'],
      prenom: json['prenom'],
      email: json['email'],
      password: json['password'],
      tel: json['tel']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'nom': nom,
        'prenom': prenom,
        'email': email,
        'password': password,
        'tel': tel
      };
}
