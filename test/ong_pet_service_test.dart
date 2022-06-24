import 'package:flutter_test/flutter_test.dart';
import 'package:ong_pet_desafio/domain/services/my_http_client.dart';
import 'package:ong_pet_desafio/domain/services/ong_pet_service.dart';


void main() {

  test('deve retornar todos os cachorros', () async {
    final IHttpClient client;
    OngPetService(client);
    final service = OngPetService(client);
    final dogs = await service.getAllDogs();
    expect(dogs[0].name, 'Affenpinscher');
  });
}