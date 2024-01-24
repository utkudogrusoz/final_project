import 'package:final_project/feature/models/location_model.dart';

class FoundationDetailResponseModel {
  int? status;
  String? message;
  Data? data;

  FoundationDetailResponseModel({this.status, this.message, this.data});

  FoundationDetailResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  int? id;
  String? name;
  String? mail;
  String? phone;
  String? logo;
  String? description;
  List<Events>? events;

  Data(
      {this.id,
      this.name,
      this.mail,
      this.phone,
      this.logo,
      this.description,
      this.events});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mail = json['mail'];
    phone = json['phone'];
    logo = json['logo'];
    description = json['description'];
    if (json['Events'] != null) {
      events = <Events>[];
      json['Events'].forEach((v) {
        events!.add(new Events.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mail'] = this.mail;
    data['phone'] = this.phone;
    data['logo'] = this.logo;
    data['description'] = this.description;
    if (this.events != null) {
      data['Events'] = this.events!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Events {
  int? id;
  int? foundationID;
  String? name;
  String? dateTime;
  int? locationID;
  LocationModel? location;

  Events(
      {this.id,
      this.foundationID,
      this.name,
      this.dateTime,
      this.locationID,
      this.location});

  Events.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    foundationID = json['foundationID'];
    name = json['name'];
    dateTime = json['dateTime'];
    locationID = json['locationID'];
    location = json['Location'] != null
        ? new LocationModel.fromJson(json['Location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['foundationID'] = this.foundationID;
    data['name'] = this.name;
    data['dateTime'] = this.dateTime;
    data['locationID'] = this.locationID;
    if (this.location != null) {
      data['Location'] = this.location!.toJson();
    }
    return data;
  }
}
