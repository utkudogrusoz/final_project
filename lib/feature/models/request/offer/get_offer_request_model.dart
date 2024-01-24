class GetOfferRequestModel {
  int? userId;

  GetOfferRequestModel({this.userId});

  GetOfferRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['user_id'] = userId;
    return data;
  }
}