import 'package:flutter/material.dart';
import 'package:ong_pet_desafio/ui/style/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Ong Pets'),
            Image.asset('assets/images/logo.png', width: 50,),
          ],
        ),
        centerTitle: true,
      ),
    );
  }
}
