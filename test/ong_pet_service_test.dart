import 'package:ong_pet_desafio/domain/services/dio_client.dart';
import 'package:ong_pet_desafio/domain/services/ong_pet_service.dart';


void main() async {
  final service = OngPetService(DioClient());
  final cats = await service.getAllCats();
  print(cats[0].name);


  // test('deve retornar todos os cachorros', () async {
  //   final IHttpClient client;
  //   OngPetService(client);
  //   final service = OngPetService(client);
  //   final dogs = await service.getAllDogs();
  //   expect(dogs[0].name, 'Affenpinscher');
  // });
}