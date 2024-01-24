class IdentityRequestModel {
  String? tcno;
  String? name;
  String? lastname;
  String? birthday;

  IdentityRequestModel({this.tcno, this.name, this.lastname, this.birthday});

  IdentityRequestModel.fromJson(Map<String, dynamic> json) {
    tcno = json['tcno'];
    name = json['name'];
    lastname = json['lastname'];
    birthday = json['birthday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tcno'] = tcno;
    data['name'] = name;
    data['lastname'] = lastname;
    data['birthday'] = birthday;
    return data;
  }
}
