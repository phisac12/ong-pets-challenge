import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ong_pet_desafio/domain/controller/ong_pet_controller.dart';
import 'package:ong_pet_desafio/domain/model/ong_cat_model.dart';
import 'package:ong_pet_desafio/domain/model/ong_pet_model.dart';
import 'package:ong_pet_desafio/domain/services/dio_client.dart';
import 'package:ong_pet_desafio/domain/services/ong_pet_service.dart';
import 'package:ong_pet_desafio/ui/screens/single_animal_page.dart';
import 'package:ong_pet_desafio/ui/screens/single_cat_widget.dart';
import 'package:ong_pet_desafio/ui/style/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = OngPetController(OngPetService(DioClient()));

  @override
  void initState() {
    controller.fetchAllDogs();
    controller.fetchAllCats();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: AppColors.secondaryColor,
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text('Ong Pets', style: GoogleFonts.staatliches(fontSize: 25, fontWeight: FontWeight.w200),),
                  Image.asset(
                    'assets/images/logo.png',
                    width: 65,
                  ),
                ],
              ),
              Text('Pets Disponíveis para adoção', style: GoogleFonts.staatliches(fontSize: 20, fontWeight: FontWeight.w200),)
            ],
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/dog.png', width: 35,),
                ),
              ),
              Tab(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/cat.png', width: 35,),
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, widget) {
                 return ListView.builder(
                      itemCount: controller.dogsGet.length,
                      itemBuilder: (context, index) {
                        final dog = controller.dogsGet[index];
                        return Column(
                          children: [
                            buildDogList(dog),
                          ],
                        );
                      });
                },
              ),
            ),
            Center(
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, widget) {
                  return ListView.builder(
                      itemCount: controller.catsGet.length,
                      itemBuilder: (context, index) {
                        final cat = controller.catsGet[index];
                        return Column(
                          children: [
                            buildCatList(cat),
                          ],
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

 Widget buildDogList(OngPetModel dog) {
    return Card(
      elevation: 10,
      child: ListTile(
        leading: const Icon(Icons.arrow_right),
        trailing: const Icon(Icons.pets),
        onTap: () => Get.to(SingleDogWidget(dogAnimal: dog,)),
        subtitle: Row(
          children: [
            Text('Tempo médio de vida - ', style: GoogleFonts.staatliches(fontSize: 15, fontWeight: FontWeight.w200),),
            Text(dog.lifeSpan!, style: GoogleFonts.staatliches(fontSize: 15, fontWeight: FontWeight.w200),),
          ],
        ),
        title: Text(dog.name!, style: GoogleFonts.staatliches(fontWeight: FontWeight.w400, fontSize: 25, color: Colors.black)),
      ),
    );
  }

  Widget buildCatList(OngCatModel cat) {
    return Card(
      elevation: 10,
      child: ListTile(
        leading: const Icon(Icons.arrow_right),
        trailing: const Icon(Icons.pets),
        onTap: () => Get.to(SingleCatWidget(catAnimal: cat,)),
        subtitle: Row(
          children: [
            Text('Tempo médio de vida - ', style: GoogleFonts.staatliches(fontSize: 15, fontWeight: FontWeight.w200),),
            Text(cat.lifeSpan!, style: GoogleFonts.staatliches(fontSize: 15, fontWeight: FontWeight.w200),),
          ],
        ),
        title: Text(cat.name!, style: GoogleFonts.staatliches(fontWeight: FontWeight.w400, fontSize: 25, color: Colors.black)),
      ),
    );
  }
}
