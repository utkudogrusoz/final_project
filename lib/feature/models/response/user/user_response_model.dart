import '../../user_model.dart';

class UserResponseModel {
  String? status;
  UserModel? user;

  UserResponseModel({this.status, this.user});

  UserResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['message'];
    user = json['data'] != null ? UserModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = status;
    if (user != null) {
      data['data'] = user!.toJson();
    }
    return data;
  }
}
