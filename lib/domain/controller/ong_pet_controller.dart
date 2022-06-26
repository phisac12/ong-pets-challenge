import 'package:flutter/material.dart';
import 'package:ong_pet_desafio/domain/model/ong_pet_model.dart';
import 'package:ong_pet_desafio/domain/services/ong_pet_service.dart';

class OngPetController extends ChangeNotifier{

  final OngPetService _service;

  OngPetController(this._service);

  var pets = <OngPetModel>[];

  Future<void> fetchAllPets() async {
    pets = await _service.getAllDogs();
    notifyListeners();
  }

}