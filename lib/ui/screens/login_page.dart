import 'package:flutter/material.dart';
import 'package:ong_pet_desafio/domain/controller/login_controller.dart';
import 'package:ong_pet_desafio/ui/screens/home_page.dart';
import 'package:ong_pet_desafio/ui/style/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        toolbarHeight: 120,
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo.png',
          width: 160,
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [
              AppColors.primaryColor,
              AppColors.secondaryColor,
            ])),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      filled: true,
                        fillColor: Colors.white,
                        labelText: 'Digite seu e-mail',
                        labelStyle: GoogleFonts.staatliches(fontSize: 15),
                        prefixIcon: const Icon(Icons.email),
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                ElevatedButton(
                    onPressed: () {
                      loginController.emailData.value = emailController.text;
                      if(loginController.verifyEmail() == true){
                        Get.to(HomePage());
                      } else if (!loginController.verifyEmail()){
                        showTopSnackBar(context, const CustomSnackBar.error(message: 'Você não está autorizado a logar'));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green
                    ),
                    child: Text('Entrar', style: GoogleFonts.staatliches(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.greenAccent.shade100)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
