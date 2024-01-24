class CreateOfferRequestModel {
  int? itemId;
  int? newOffer;
  int? userId;

  CreateOfferRequestModel({this.itemId, this.newOffer, this.userId});

  CreateOfferRequestModel.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    newOffer = json['newOffer'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_id'] = itemId;
    data['newOffer'] = newOffer;
    data['user_id'] = userId;
    return data;
  }
}
