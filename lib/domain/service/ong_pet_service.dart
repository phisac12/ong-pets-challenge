import 'package:dio/dio.dart';
import 'package:ong_pet_desafio/domain/model/ong_pet_model.dart';

class OngPetService {
  static const url = 'https://api.thedogapi.com/v1/breeds';
  var dio = Dio();

  Future<List<OngPetModel>> getAllDogs() async {
    final response = await dio.get(url);
    final body = response.data as List;
    final dogs = body
        .map((map) => OngPetModel(
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
            imageUrl: map['image']['url']))
        .toList();

    return dogs;
  }
}
