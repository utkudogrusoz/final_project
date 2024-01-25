class RegisterEventResponseModel {
  int? status;
  String? message;
  Register? data;

  RegisterEventResponseModel({this.status, this.message, this.data});

  RegisterEventResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Register.fromJson(json['data']) : null;
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

class Register {
  int? id;
  int? userID;
  int? eventID;
  bool? isAttended;

  Register({this.id, this.userID, this.eventID, this.isAttended});

  Register.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userID = json['userID'];
    eventID = json['eventID'];
    isAttended = json['isAttended'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userID'] = this.userID;
    data['eventID'] = this.eventID;
    data['isAttended'] = this.isAttended;
    return data;
  }
}
