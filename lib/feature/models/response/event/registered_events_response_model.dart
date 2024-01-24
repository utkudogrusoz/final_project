class RegisteredEventsResponseModel {
  int? status;
  String? message;
  List<Data>? data;

  RegisteredEventsResponseModel({this.status, this.message, this.data});

  RegisteredEventsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? id;
  int? userID;
  int? eventID;
  bool? isAttended;
  Event? event;

  Data({this.id, this.userID, this.eventID, this.isAttended, this.event});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userID = json['userID'];
    eventID = json['eventID'];
    isAttended = json['isAttended'];
    event = json['Event'] != null ? new Event.fromJson(json['Event']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userID'] = this.userID;
    data['eventID'] = this.eventID;
    data['isAttended'] = this.isAttended;
    if (this.event != null) {
      data['Event'] = this.event!.toJson();
    }
    return data;
  }
}

class Event {
  int? id;
  int? foundationID;
  String? name;
  String? dateTime;
  int? locationID;
  Foundation? foundation;

  Event(
      {this.id,
      this.foundationID,
      this.name,
      this.dateTime,
      this.locationID,
      this.foundation});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    foundationID = json['foundationID'];
    name = json['name'];
    dateTime = json['dateTime'];
    locationID = json['locationID'];
    foundation = json['Foundation'] != null
        ? new Foundation.fromJson(json['Foundation'])
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
