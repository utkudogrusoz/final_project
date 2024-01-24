class UserFoundationResponseModel {
  int? status;
  String? message;
  List<Donation>? data;

  UserFoundationResponseModel({this.status, this.message, this.data});

  UserFoundationResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Donation>[];
      json['data'].forEach((v) {
        data!.add(new Donation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Donation {
  int? id;
  int? userID;
  int? foundationID;
  int? price;
  String? date;
  Foundation? foundation;

  Donation(
      {this.id,
      this.userID,
      this.foundationID,
      this.price,
      this.date,
      this.foundation});

  Donation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userID = json['userID'];
    foundationID = json['foundationID'];
    price = json['price'];
    date = json['date'];
    foundation = json['Foundation'] != null
        ? new Foundation.fromJson(json['Foundation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userID'] = this.userID;
    data['foundationID'] = this.foundationID;
    data['price'] = this.price;
    data['date'] = this.date;
    if (this.foundation != null) {
      data['Foundation'] = this.foundation!.toJson();
    }
    return data;
  }
}

class Foundation {
  String? name;
  String? logo;

  Foundation({this.name, this.logo});

  Foundation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['logo'] = this.logo;
    return data;
  }
}
