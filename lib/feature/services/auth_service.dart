import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/url_constant.dart';
import '../models/request/user/user_create_request_model.dart';
import '../models/request/user/user_login_request_model.dart';
import '../models/response/user/user_response_model.dart';

class AuthService {
  Future<UserResponseModel?>? register({
    @required String? mail,
    @required String? password,
    @required int? tcNo,
    @required String? name,
    @required String? surname,
    @required int? birthday,
    @required String? phone,
  }) async {
    try {
      Uri uri = Uri.http(UrlConstant.baseUrl, UrlConstant.createUserUrl);

      var response = await http.post(uri,
          body: UserCreateRequestModel(
            mail: mail!.trim(),
            name: name,
            password: password,
            phone: phone,
            surname: surname,
            birthdate: birthday.toString(),
          ).toJson());

      if (response.statusCode == 201) {
        UserResponseModel user =
            UserResponseModel.fromJson(jsonDecode(response.body));
        return user;
      } else {}
    } catch (e) {}
    return null;
  }

  Future<UserResponseModel?>? login(
      {@required String? mail, @required String? password}) async {
    try {
      Uri uri = Uri.http(UrlConstant.baseUrl, UrlConstant.loginUrl);

      var response = await http.post(uri,
          body: UserLoginRequestModel(
            mail: mail!.trim(),
            password: password,
          ).toJson());


      if (response.statusCode == 200) {
        UserResponseModel user =
            UserResponseModel.fromJson(jsonDecode(response.body));
        return user;
      } else {}
    } catch (e) {}
    return null;
  }





}
