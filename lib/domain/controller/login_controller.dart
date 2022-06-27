import 'package:get/get.dart';

class LoginController extends GetxController {
  static const emails = [
    'john@hotmail.com',
    'isaac@gmail.com',
    'teste@gmail.com',
    'teste2@gmail.com'
  ];

  var emailData = ''.obs;

  verifyEmail() {
    var resultEmail = emails.contains(emailData.value);
    return resultEmail;
  }
}
