import 'dart:convert';

import 'package:final_project/feature/models/response/event/foundation_detail_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../core/constants/url_constant.dart';

class FoundationService {
  Future<FoundationDetailResponseModel?>? getFoundationDetail(
      {@required String? foundationId}) async {
    try {
      Uri uri = Uri.http(UrlConstant.baseUrl,
          UrlConstant.getFoundationDetail + '/' + foundationId!);

      var response = await http.get(uri);

      if (response.statusCode == 200) {
        FoundationDetailResponseModel event =
            FoundationDetailResponseModel.fromJson(jsonDecode(response.body));
        return event;
      } else {}
    } catch (e) {}
    return null;
  }
}
