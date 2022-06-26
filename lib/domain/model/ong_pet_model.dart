class OngPetModel {
  final int id;
  final String? name;
  final String? bredFor;
  final String? breedGroup;
  final String? lifeSpan;
  final String? temperament;
  final String? origin;
  final String? imageUrl;

  OngPetModel({
    required this.id,
    this.name,
    this.bredFor,
    this.breedGroup,
    this.lifeSpan,
    this.temperament,
    this.origin,
    this.imageUrl,
  });

  static OngPetModel fromJson(Map map) {
    return OngPetModel(
        id: map['id'],
        name: map['name'],
        bredFor: map['bred_for'],
        breedGroup: map['breed_group'],
        lifeSpan: map['life_span'],
        temperament: map['temperament'],
        origin: map['origin'],
        imageUrl: map['image']['url']);
  }
}
