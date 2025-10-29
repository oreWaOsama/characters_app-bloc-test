// Rename class Results → Character
class Character {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Origin? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  Character({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin: json['origin'] != null ? Origin.fromJson(json['origin']) : null,
      location:
          json['location'] != null ? Origin.fromJson(json['location']) : null,
      image: json['image'],
      episode: List<String>.from(json['episode']),
      url: json['url'],
      created: json['created'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'status': status,
    'species': species,
    'type': type,
    'gender': gender,
    'origin': origin?.toJson(),
    'location': location?.toJson(),
    'image': image,
    'episode': episode,
    'url': url,
    'created': created,
  };
}

// Definition for Origin class
class Origin {
  String? name;
  String? url;

  Origin({this.name, this.url});

  factory Origin.fromJson(Map<String, dynamic> json) {
    return Origin(name: json['name'], url: json['url']);
  }

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}
