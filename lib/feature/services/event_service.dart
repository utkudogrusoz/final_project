import '../../core/constants/url_constant.dart';
import '../models/response/event/all_events_response_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EventService {
  Future<AllEventsResponseModel?>? getAllEvents() async {
    try {
      Uri uri = Uri.http(UrlConstant.baseUrl, UrlConstant.getAllEventsUrl);

      var response = await http.get(uri);

      if (response.statusCode == 200) {
        AllEventsResponseModel event =
            AllEventsResponseModel.fromJson(jsonDecode(response.body));
        return event;
      } else {}
    } catch (e) {}
    return null;
  }
}
