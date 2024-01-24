class UserLoginRequestModel {
  String? mail;
  String? password;

  UserLoginRequestModel({this.mail, this.password});

  UserLoginRequestModel.fromJson(Map<String, dynamic> json) {
    mail = json['mail'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mail'] = mail;
    data['password'] = password;
    return data;
  }
}
