class UserLogoutResponse {
  String? status;
  String? message;
  String? data;

  UserLogoutResponse({this.status, this.message, this.data});

  UserLogoutResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}
