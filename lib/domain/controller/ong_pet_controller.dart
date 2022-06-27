import 'package:flutter/material.dart';
import 'package:ong_pet_desafio/domain/model/ong_cat_model.dart';
import 'package:ong_pet_desafio/domain/model/ong_pet_model.dart';
import 'package:ong_pet_desafio/domain/services/ong_pet_service.dart';

class OngPetController extends ChangeNotifier{

  final OngPetService _service;

  OngPetController(this._service);

  var dogsGet = <OngPetModel>[];
  var catsGet = <OngCatModel>[];

  Future<void> fetchAllDogs() async {
    dogsGet = await _service.getAllDogs();
    notifyListeners();
  }

  Future<void> fetchAllCats() async {
    catsGet = await _service.getAllCats();
    notifyListeners();
  }

}