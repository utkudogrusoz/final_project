class DonateFoundationResponseModel {
  int? status;
  String? message;
  DonateFoundation? data;

  DonateFoundationResponseModel({this.status, this.message, this.data});

  DonateFoundationResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new DonateFoundation.fromJson(json['data']) : null;
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

class DonateFoundation {
  int? id;
  int? userID;
  int? foundationID;
  int? price;
  String? date;

  DonateFoundation({this.id, this.userID, this.foundationID, this.price, this.date});

  DonateFoundation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userID = json['userID'];
    foundationID = json['foundationID'];
    price = json['price'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userID'] = this.userID;
    data['foundationID'] = this.foundationID;
    data['price'] = this.price;
    data['date'] = this.date;
    return data;
  }
}
