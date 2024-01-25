class DonateFoundationRequestModel {
  String? foundationID;
  String? price;

  DonateFoundationRequestModel({this.foundationID, this.price});

  DonateFoundationRequestModel.fromJson(Map<String, dynamic> json) {
    foundationID = json['foundationID'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['foundationID'] = this.foundationID;
    data['price'] = this.price;
    return data;
  }
}
