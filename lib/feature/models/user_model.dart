class UserModel {
  int? id;
  String? mail;
  String? name;
  String? surname;
  String? phone;


  UserModel({
    this.id,
    this.mail,
    this.name,
    this.surname,
    this.phone,

  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 999999999999;
    mail = json['mail'] ?? '';
    name = json['name'] ?? '';
    surname = json['surname'] ?? '';
    phone = json['phone'] ?? '';

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mail'] = mail;
    data['name'] = name;
    data['surname'] = surname;
    data['phone'] = phone;
    return data;
  }
}
