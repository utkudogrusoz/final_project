import 'dart:convert';

import 'package:final_project/feature/models/response/event/get_user_foundation_response_model.dart';
import 'package:final_project/feature/models/response/event/register_event_response_model.dart';
import 'package:final_project/feature/models/response/event/registered_events_response_model.dart';
import 'package:http/http.dart' as http;
import '../../core/constants/url_constant.dart';
import '../models/request/user/donate_foundation_request_model.dart';
import '../models/request/user/register_event_request_model.dart';
import '../models/response/event/donate_foundation_response_model.dart';

class UserService {
  Future<RegisteredEventsResponseModel?>? getRegisteredEvents(
      {int? userId}) async {
    try {
      Uri uri = Uri.http(UrlConstant.baseUrl,
          UrlConstant.getRegisteredEvents + '/' + userId.toString());

      var response = await http.get(uri);

      if (response.statusCode == 200) {
        RegisteredEventsResponseModel event =
            RegisteredEventsResponseModel.fromJson(jsonDecode(response.body));
        return event;
      } else {}
    } catch (e) {}
    return null;
  }

  Future<UserFoundationResponseModel?>? getUserFoundations(
      {int? userId}) async {
    try {
      Uri uri = Uri.http(UrlConstant.baseUrl,
          UrlConstant.getDonations + '/' + userId.toString());

      var response = await http.get(uri);

      if (response.statusCode == 200) {
        UserFoundationResponseModel event =
            UserFoundationResponseModel.fromJson(jsonDecode(response.body));
        return event;
      } else {}
    } catch (e) {}
    return null;
  }

  Future<RegisterEventResponseModel?>? registerToEvent(
      {String? userId, String? eventId}) async {
    try {
      Uri uri = Uri.http(UrlConstant.baseUrl,
          UrlConstant.registerToEvent + '/' + eventId.toString());

      var response = await http.post(uri,
          body: RegisterEventRequestModel(userID: userId!).toJson());
      print(response.statusCode);
      if (response.statusCode == 201) {
        RegisterEventResponseModel user =
            RegisterEventResponseModel.fromJson(jsonDecode(response.body));
        return user;
      } else {}
    } catch (e) {}
    return null;
  }

  Future<DonateFoundationResponseModel?>? donateToFoundation(
      {String? userId, String? foundationId, String? price}) async {
    try {
      Uri uri = Uri.http(UrlConstant.baseUrl,
          UrlConstant.donateToFoundation + '/' + userId.toString());

      var response = await http.post(uri,
          body: DonateFoundationRequestModel(
                  price: price, foundationID: foundationId!)
              .toJson());
      print(response.statusCode);
      if (response.statusCode == 201) {
        DonateFoundationResponseModel user =
            DonateFoundationResponseModel.fromJson(jsonDecode(response.body));
        return user;
      } else {}
    } catch (e) {}
    return null;
  }
}
