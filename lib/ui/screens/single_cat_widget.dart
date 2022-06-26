import 'package:flutter/material.dart';
import 'package:ong_pet_desafio/domain/model/ong_cat_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class SingleCatWidget extends StatelessWidget {
  SingleCatWidget({Key? key,  required OngCatModel this.catAnimal}) : super(key: key);

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
      body: buildCatScreen(context, catAnimal!),
    );
  }

  Widget buildCatScreen(BuildContext context, OngCatModel cat) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            cat.name!,
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
                backgroundImage: NetworkImage(cat.imageUrl!),
              ),
            ),
          ),
          Text(
            'Tempo de vida ${cat.lifeSpan!}',
            style: GoogleFonts.fjallaOne(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: '${cat.description ?? 'Sem info'} \n',
              style: GoogleFonts.fjallaOne(
                  fontWeight: FontWeight.w500, fontSize: 15),
              children: <TextSpan>[
                TextSpan(
                    text: '${cat.origin} \n',
                    style: GoogleFonts.fjallaOne(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black)),
                TextSpan(
                    text: '${cat.temperament} \n',
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
