import 'package:final_project/feature/models/response/user/user_response_model.dart';
import 'package:final_project/feature/pages/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final TextEditingController? loginTextEditingController =
      TextEditingController();
  final TextEditingController? passwordTextEditingController =
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

      Navigator.push(
          context!, MaterialPageRoute(builder: (context) => HomeView()));
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
