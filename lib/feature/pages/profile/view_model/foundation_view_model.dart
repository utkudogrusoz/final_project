import 'package:final_project/feature/models/event_model.dart';
import 'package:final_project/feature/models/response/event/all_events_response_model.dart';
import 'package:final_project/feature/models/response/event/foundation_detail_response_model.dart';
import 'package:final_project/feature/services/event_service.dart';
import 'package:final_project/feature/services/foundation_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FoundationViewModel extends ChangeNotifier {
  List<Events> allEvents = [];

  final _foundationService = FoundationService();

  Future<void> getAllEvents({@required String? foundationId}) async {
    if (allEvents.isEmpty) {
      final FoundationDetailResponseModel? getAllEventResponse =
          await _foundationService.getFoundationDetail(
              foundationId: foundationId);

      if (getAllEventResponse!.status == 200) {
        print(getAllEventResponse);
        allEvents.addAll(getAllEventResponse.data!.events!);
        notifyListeners();
      } else {
        print('Hata var');
      }
    }
    // ignore: omit_local_variable_types
  }
}
