class IdentityResponseModel {
  int? status;
  String? message;
  bool? data;

  IdentityResponseModel({this.status, this.message, this.data});

  IdentityResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] as int;
    message = json['message'] as String;
    data = json['data'] as bool;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status as int;
    data['message'] = message;
    data['data'] = data;
    return data;
  }
}
