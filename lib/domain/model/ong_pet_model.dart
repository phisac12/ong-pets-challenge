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
}
