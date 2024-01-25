class RegisterEventRequestModel {
  String? userID;

  RegisterEventRequestModel({this.userID});

  RegisterEventRequestModel.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    return data;
  }
}
