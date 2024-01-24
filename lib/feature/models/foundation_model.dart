class FoundationModel {
  int? id;
  String? name;
  String? mail;
  String? phone;
  String? logo;
  String? description;

  FoundationModel(
      {this.id, this.name, this.mail, this.phone, this.logo, this.description});

  FoundationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mail = json['mail'];
    phone = json['phone'];
    logo = json['logo'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mail'] = this.mail;
    data['phone'] = this.phone;
    data['logo'] = this.logo;
    data['description'] = this.description;
    return data;
  }
}