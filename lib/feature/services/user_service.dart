import 'dart:convert';

import 'package:final_project/feature/models/response/event/get_user_foundation_response_model.dart';
import 'package:final_project/feature/models/response/event/registered_events_response_model.dart';
import 'package:http/http.dart' as http;
import '../../core/constants/url_constant.dart';

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
}
