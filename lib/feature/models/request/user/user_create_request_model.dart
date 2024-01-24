class UserCreateRequestModel {
  String? name;
  String? surname;
  String? password;
  String? mail;
  String? phone;
  String? birthdate;

  UserCreateRequestModel(
      {this.name,
      this.surname,
      this.password,
      this.mail,
      this.phone,
      this.birthdate});

  UserCreateRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
    password = json['password'];
    mail = json['mail'];
    phone = json['phone'];
    birthdate = json['birthdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['surname'] = surname;
    data['password'] = password;
    data['mail'] = mail;
    data['phone'] = phone;
    data['birthdate'] = birthdate;

    return data;
  }
}
