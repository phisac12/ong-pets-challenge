import 'package:flutter/material.dart';
import 'package:ong_pet_desafio/domain/controller/ong_pet_controller.dart';
import 'package:ong_pet_desafio/domain/services/dio_client.dart';
import 'package:ong_pet_desafio/domain/services/ong_pet_service.dart';
import 'package:ong_pet_desafio/ui/style/app_colors.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = OngPetController(OngPetService(DioClient()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent.shade200,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Ong Pets'),
            const SizedBox(
              width: 5,
            ),
            Image.asset(
              'assets/images/logo.png',
              width: 65,
            ),
          ],
        ),
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, widget) {
         return ListView.builder(
              itemCount: controller.pets.length,
              itemBuilder: (context, index) {
                final dog = controller.pets[index];
                return ListTile(
                  title: Text(dog.name),
                );
              });
        },
      ),
    );
  }
}
