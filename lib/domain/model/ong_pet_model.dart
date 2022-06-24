class OngPetModel {
  final int id;
  final String name;
  final String? bredFor;
  final String? breedGroup;
  final String lifeSpan;
  final String? temperament;
  final String? origin;
  final String idImage;
  final int width;
  final int height;
  final String imageUrl;

  OngPetModel({
    required this.id,
    required this.name,
    this.bredFor,
    this.breedGroup,
    required this.lifeSpan,
     this.temperament,
    this.origin,
    required this.idImage,
    required this.width,
    required this.height,
    required this.imageUrl,
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
        idImage: map['image']['id'],
        width: map['image']['width'],
        height: map['image']['height'],
        imageUrl: map['image']['url']);
  }
}
