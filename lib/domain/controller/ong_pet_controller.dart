
import 'package:ong_pet_desafio/domain/model/ong_pet_model.dart';
import 'package:ong_pet_desafio/domain/services/dio_client.dart';
import 'package:ong_pet_desafio/domain/services/ong_pet_service.dart';

class OngPetController {
  final _service = OngPetService(DioClient());
  var pets = <OngPetModel>[];

  Future<void> fetchAllPets() async {
    pets = await _service.getAllDogs();
  }

}