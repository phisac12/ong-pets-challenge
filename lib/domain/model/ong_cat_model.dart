class OngCatModel {
  final String id;
  final String? name;
  final String? temperament;
  final String? origin;
  final String? description;
  final String? lifeSpan;
  final String? imageUrl;


  OngCatModel(
      {required this.id,
      this.name,
      this.temperament,
      this.origin,
      this.description,
      this.lifeSpan,
      this.imageUrl});

  static OngCatModel fromJson(Map map) {
    print(map.keys);
    return OngCatModel(
      id: map['id'],
      name: map['name'],
      temperament: map['temperament'],
      origin: map['origin'],
      description: map['description'],
      lifeSpan: map['life_span'],
      imageUrl: map['image'] == null || map['image']['url'] == null ?  'https://cdn2.vectorstock.com/i/1000x1000/82/41/404-error-page-not-found-funny-fat-cat-vector-21288241.jpg' : map['image']['url'],
    );
  }

}