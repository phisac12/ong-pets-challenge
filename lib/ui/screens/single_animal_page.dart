import 'package:flutter/material.dart';
import 'package:ong_pet_desafio/domain/model/ong_cat_model.dart';
import 'package:ong_pet_desafio/domain/model/ong_pet_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class SingleDogWidget extends StatelessWidget {
  SingleDogWidget({Key? key, this.dogAnimal, this.catAnimal})
      : super(key: key);

  OngPetModel? dogAnimal;
  OngCatModel? catAnimal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
      ),
      body: buildDogScreen(context, dogAnimal),
    );
  }

  Widget buildDogScreen(BuildContext context, OngPetModel? dog) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dog!.name!,
            style: GoogleFonts.fjallaOne(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CircleAvatar(
              radius: 120,
              backgroundColor: Colors.black,
              child: CircleAvatar(
                radius: 115,
                backgroundImage: NetworkImage(dog.imageUrl!),
              ),
            ),
          ),
          Text(
            'Tempo de vida ${dog.lifeSpan!}',
            style: GoogleFonts.fjallaOne(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: '${dog.bredFor ?? 'Sem info'} \n',
              style: GoogleFonts.fjallaOne(
                  fontWeight: FontWeight.w500, fontSize: 15),
              children: <TextSpan>[
                TextSpan(
                    text: '${dog.origin} \n',
                    style: GoogleFonts.fjallaOne(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black)),
                TextSpan(
                    text: '${dog.temperament} \n',
                    style: GoogleFonts.fjallaOne(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black)),
                TextSpan(
                    text: '${dog.breedGroup} \n',
                    style: GoogleFonts.fjallaOne(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black)),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () => null,
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: Text(
                'Adotar',
                style: GoogleFonts.fjallaOne(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.black),
              ))
        ],
      ),
    );
  }
}
