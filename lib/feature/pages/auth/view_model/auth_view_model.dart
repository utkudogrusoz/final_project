import 'package:final_project/feature/models/response/user/user_response_model.dart';
import 'package:final_project/feature/pages/auth/view/login_view.dart';
import 'package:final_project/feature/pages/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final TextEditingController? loginTextEditingController =
      TextEditingController();
  final TextEditingController? passwordTextEditingController =
      TextEditingController();

  final TextEditingController? registerPasswordTextEditingController =
      TextEditingController();

  final TextEditingController? registerMailTextEditingController =
      TextEditingController();

  final TextEditingController? registerNameTextEditingController =
      TextEditingController();

  final TextEditingController? registerSurnameTextEditingController =
      TextEditingController();
  final TextEditingController? registerPhoneFTextEditingController =
      TextEditingController();

  final AuthService _authService = AuthService();

  bool passwordVisibility = true;

  Future<void> loginAccount({BuildContext? context}) async {
    // ignore: omit_local_variable_types
    final UserResponseModel? loginSuccessResponse = await _authService.login(
      mail: loginTextEditingController!.text,
      password: passwordTextEditingController!.text,
    );
    print(loginTextEditingController!.text);
    print(passwordTextEditingController!.text);

    if (loginSuccessResponse!.user!.mail != '') {
      var box = await Hive.box('user');
      box.put('id', loginSuccessResponse.user!.id);
      box.put('mail', loginSuccessResponse.user!.mail);
      box.put('name', loginSuccessResponse.user!.name);
      box.put('phone', loginSuccessResponse.user!.phone);
      box.put('surname', loginSuccessResponse.user!.surname);
      var mail = box.get('mail');
      print('mail: $mail');

      Navigator.pushAndRemoveUntil(
        context!,
        MaterialPageRoute(builder: (context) => HomeView()),
        (route) => false,
      );
    } else {
      print('Hata var');
    }
  }

  Future<void> register({BuildContext? context}) async {
    // ignore: omit_local_variable_types
    final UserResponseModel? loginSuccessResponse = await _authService.register(
      mail: registerMailTextEditingController!.text,
      password: registerPasswordTextEditingController!.text,
      birthday: '10-10-2000',
      name: registerNameTextEditingController!.text,
      phone: registerPhoneFTextEditingController!.text,
      surname: registerSurnameTextEditingController!.text,
    );

    if (loginSuccessResponse!.user!.mail != '') {
      Navigator.pushAndRemoveUntil(
        context!,
        MaterialPageRoute(builder: (context) => LoginView()),
        (route) => false,
      );
    } else {
      print('Hata var');
    }
  }

  void changePasswordVisibility() {
    if (passwordVisibility == true) {
      passwordVisibility = false;
    } else {
      passwordVisibility = true;
    }
    notifyListeners();
  }
}
