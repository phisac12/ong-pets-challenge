import 'package:dio/dio.dart';
import 'package:ong_pet_desafio/domain/model/ong_cat_model.dart';
import 'package:ong_pet_desafio/domain/model/ong_pet_model.dart';
import 'package:ong_pet_desafio/domain/services/my_http_client.dart';

const url = 'https://api.thedogapi.com/v1/breeds';
const catsUrl = 'https://api.thecatapi.com/v1/breeds';

class OngPetService {
   final IHttpClient client;
  var dio = Dio();

  OngPetService(this.client);

  Future<List<OngPetModel>> getAllDogs() async {
    final body = await client.get(url);
    final dogs = (body as List).map((map) => OngPetModel.fromJson(map)).toList();
    return dogs;
  }

  Future<List<OngCatModel>> getAllCats() async {
    final body = await client.get(catsUrl);
    final cats = (body as List).map((map) => OngCatModel.fromJson(map)).toList();
    return cats;
  }
}
