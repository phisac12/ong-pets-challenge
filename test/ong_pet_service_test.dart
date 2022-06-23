import 'package:flutter_test/flutter_test.dart';
import 'package:ong_pet_desafio/domain/service/ong_pet_service.dart';


void main() async {
  final service = OngPetService();
  final dogs = await service.getAllDogs();
  print(dogs[0].name);
}