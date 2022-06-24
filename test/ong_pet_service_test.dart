import 'package:flutter_test/flutter_test.dart';
import 'package:ong_pet_desafio/domain/service/ong_pet_service.dart';


void main() {

  test('deve retornar todos os cachorros', () async {
    final service = OngPetService();
    final dogs = await service.getAllDogs();
    expect(dogs[0].name, 'Affenpinscher');
  });
}