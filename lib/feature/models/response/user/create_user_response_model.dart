class CreateUserResponseModel {
  int? status;
  String? message;
  User? data;

  CreateUserResponseModel({this.status, this.message, this.data});

  CreateUserResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new User.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? password;
  String? name;
  String? surname;
  String? mail;
  String? phone;
  String? birthdate;

  User(
      {this.id,
      this.password,
      this.name,
      this.surname,
      this.mail,
      this.phone,
      this.birthdate});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    password = json['password'];
    name = json['name'];
    surname = json['surname'];
    mail = json['mail'];
    phone = json['phone'];
    birthdate = json['birthdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['password'] = this.password;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['mail'] = this.mail;
    data['phone'] = this.phone;
    data['birthdate'] = this.birthdate;
    return data;
  }
}
