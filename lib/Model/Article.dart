class Article {
  int id;
  int userId;
  double prix;
  String etat;
  String titre;
  String description;
  String marque;
  String categorie;
  String taille;
  String? couleur; // Nullable
  int? nombreDeVues; // Nullable
  int? membresInteresses; // Nullable
  DateTime? ajouteLe; // Nullable
  String? modeDePayement; // Nullable
  DateTime createdAt;
  DateTime updatedAt;
  String photo;

  Article({
    required this.id,
    required this.userId,
    required this.prix,
    required this.etat,
    required this.titre,
    required this.description,
    required this.marque,
    required this.categorie,
    required this.taille,
    this.couleur,
    this.nombreDeVues,
    this.membresInteresses,
    this.ajouteLe,
    this.modeDePayement,
    required this.createdAt,
    required this.updatedAt,
    required this.photo,
  });

  // Méthode pour convertir un JSON en instance de Article
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      userId: json['user_id'],
      prix: json['prix'].toDouble(),
      etat: json['etat'],
      titre: json['titre'],
      description: json['description'],
      marque: json['marque'],
      categorie: json['categorie'],
      taille: json['taille'],
      couleur: json['couleur'],
      nombreDeVues: json['nombre_de_vues'],
      membresInteresses: json['membres_interesses'],
      ajouteLe:
          json['ajoute_le'] != null ? DateTime.parse(json['ajoute_le']) : null,
      modeDePayement: json['mode_de_payement'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      photo: json['photo'],
    );
  }

  // Méthode pour convertir une instance de Article en JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'prix': prix,
      'etat': etat,
      'titre': titre,
      'description': description,
      'marque': marque,
      'categorie': categorie,
      'taille': taille,
      'couleur': couleur,
      'nombre_de_vues': nombreDeVues,
      'membres_interesses': membresInteresses,
      'ajoute_le': ajouteLe?.toIso8601String(),
      'mode_de_payement': modeDePayement,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'photo': photo,
    };
  }
}
