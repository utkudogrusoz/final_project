import 'foundation_model.dart';
import 'location_model.dart';

class EventModel {
  int? id;
  int? foundationID;
  String? name;
  String? dateTime;
  int? locationID;
  FoundationModel? foundation;
  LocationModel? location;

  EventModel(
      {this.id,
      this.foundationID,
      this.name,
      this.dateTime,
      this.locationID,
      this.foundation,
      this.location});

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    foundationID = json['foundationID'];
    name = json['name'];
    dateTime = json['dateTime'];
    locationID = json['locationID'];
    foundation = json['Foundation'] != null
        ? FoundationModel.fromJson(json['Foundation'])
        : null;
    location = json['Location'] != null
        ? LocationModel.fromJson(json['Location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['foundationID'] = this.foundationID;
    data['name'] = this.name;
    data['dateTime'] = this.dateTime;
    data['locationID'] = this.locationID;
    if (this.foundation != null) {
      data['Foundation'] = this.foundation!.toJson();
    }
    if (this.location != null) {
      data['Location'] = this.location!.toJson();
    }
    return data;
  }
}
